package Model;

import DAO.AppointmentDAO;
import Entity.Appointment;
import org.codehaus.jettison.json.JSONArray;
import org.codehaus.jettison.json.JSONException;
import org.codehaus.jettison.json.JSONObject;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import java.util.List;

/**
 * Created by liyun on 28/12/16.
 */
@Path("/appointment")
public class AppointmentWS {

    @GET
    @Path("/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public String getAppointmentList(@PathParam("id") String id) {
        JSONArray jsonArray = new JSONArray();
        JSONObject jsonObject = new JSONObject();

        AppointmentDAO appointmentDAO = new AppointmentDAO();

        List<Appointment> appointmentList = appointmentDAO.getAppointmentListByDoctorId(id);

        try {
            for (Appointment appointment : appointmentList) {
                JSONObject apptObject = new JSONObject();
                apptObject.put("id", appointment.getAppointmentId());
                apptObject.put("title", "  " + appointment.getPatientByPatientId().getName());
                apptObject.put("start", appointment.getDateTime());
                apptObject.put("url", "http://localhost:8080/patientDetails?patientId="+appointment.getPatientByPatientId().getPatientId());
                apptObject.put("icon", "icon");
                apptObject.put("color", "#448AFF");
                jsonArray.put(apptObject);
            }
            jsonObject.put("appointments", jsonArray);
        } catch (JSONException e) {
            e.printStackTrace();
        }

        System.out.println(jsonObject.toString() + " is the json atring");

        return jsonObject.toString();
    }

}
