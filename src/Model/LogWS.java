package Model;

import DAO.VitalSignsDAO;
import Utils.ConstantValues;
import com.sun.org.apache.xpath.internal.operations.Bool;
import com.sun.org.apache.xpath.internal.operations.NotEquals;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.ws.rs.Consumes;
import javax.ws.rs.FormParam;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;
import javax.xml.ws.WebServiceContext;
import javax.xml.ws.handler.MessageContext;
import java.util.Date;

/**
 * Created by liyun on 1/1/17.
 */
@Path("/log")
public class LogWS {

    @Context
    private HttpServletRequest request;

    @POST
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    @Path("/bp")
    public void recordBP(@FormParam("dateTimeBP") Date dateTime, @FormParam("foodBP") String foodBP, @FormParam("medicationBP") String medicationBP, @FormParam("systotic") double systotic, @FormParam("diastolic") double diastolic, @FormParam("notesBP") String noteBP) {
        System.out.println(dateTime + " datela ");
        //  Instantiation
        VitalSignsDAO vitalSignsDAO = new VitalSignsDAO();
        String patientId = "", data = "", medication = "";
        Boolean success = false;

        data = systotic + "/" + diastolic;
        if(medicationBP.equalsIgnoreCase("None")){
            medication = "-";
        }else
            medication = String.valueOf(medicationBP.charAt(0));

        HttpSession session = request.getSession();
        patientId = (String) session.getAttribute("id");

        if (patientId != null)
            success = vitalSignsDAO.createVitalSign(data, ConstantValues.BLOOD_PRESSURE_TYPE, dateTime, noteBP, null, medication, String.valueOf(foodBP.charAt(0)), patientId);

        System.out.println(success);

    }

    @POST
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    @Path("/gl")
    public void recordGL(@FormParam("dateTimeGL") Date dateTime, @FormParam("foodGL") String foodGL, @FormParam("medicationGL") String medicationGL, @FormParam("glucoseLevel") double glucoseLevel, @FormParam("notesGL") String noteGL) {
        System.out.println(dateTime + " datela ");
        //  Instantiation
        VitalSignsDAO vitalSignsDAO = new VitalSignsDAO();
        String patientId = "", medication = "";
        Boolean success = false;

        if(medicationGL.equalsIgnoreCase("None")){
            medication = "-";
        }else
            medication = String.valueOf(medicationGL.charAt(0));

        HttpSession session = request.getSession();
        patientId = (String) session.getAttribute("id");

        if (patientId != null)
            success = vitalSignsDAO.createVitalSign(String.valueOf(glucoseLevel), ConstantValues.GLUCOSE_LEVEL_TYPE, dateTime, noteGL, null, medication, String.valueOf(foodGL.charAt(0)), patientId);

        System.out.println(success);

    }

}
