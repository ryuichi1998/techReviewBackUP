package Model;

import DAO.ConsultationRecordDAO;
import Entity.ConsultationRecord;
import Entity.Medication;
import com.google.gson.Gson;
import org.codehaus.jettison.json.JSONArray;
import org.codehaus.jettison.json.JSONException;
import org.codehaus.jettison.json.JSONObject;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

/**
 * Created by 153624f on 11/14/2016.
 */
@Path("/consultation")
public class BookResource {

    @GET
    @Path("/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public String getResource(@PathParam("id") String id){
        Gson gson = new Gson();

        ConsultationRecord consultationRecord = new ConsultationRecord();
        ConsultationRecordDAO consultationRecordDAO = new ConsultationRecordDAO();

        consultationRecord = consultationRecordDAO.getConsultationRecordByConsultationId(id);

        System.out.println(id + " " + consultationRecord.getDiagnosis());
//        System.out.println(gson.toJson(consultationRecord));

        JSONArray jArray = new JSONArray();
        JSONObject jObject = new JSONObject();

        try {
            jObject.put("diagnosis", consultationRecord.getDiagnosis());
            jObject.put("comment", consultationRecord.getComment());
            for(Medication medication: consultationRecord.getMedicationsByConsultationId()){
                JSONObject medObject = new JSONObject();
                medObject.put("medicationName", medication.getProductByProductId().getProductName());
                medObject.put("dose", medication.getDosage() + " " + medication.getProductByProductId().getProductUnit());
                medObject.put("freq", medication.getFrequency());
                medObject.put("quantity", medication.getQuantity());
                medObject.put("instruction", medication.getRemarks());
                jArray.put(medObject);
            }
            jObject.put("medications", jArray);
        } catch (JSONException e) {
            e.printStackTrace();
        }


        return jObject.toString();
    }

}
