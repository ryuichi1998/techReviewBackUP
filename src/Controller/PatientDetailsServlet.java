package Controller;

import DAO.ConsultationRecordDAO;
import DAO.FamilyMedicalBackgroundDAO;
import DAO.PatientDAO;
import Entity.ConsultationRecord;
import Entity.FamilyMedicalBackground;
import Entity.Medication;
import Entity.Patient;
import Logic.PatientDetailsLogic;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by liyun on 11/12/16.
 */
@WebServlet(name = "PatientDetailsServlet", urlPatterns = "/patientDetails")
public class PatientDetailsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String patientId = null;
        PatientDAO patientDAO = new PatientDAO();
        ConsultationRecordDAO consultationRecordDAO = new ConsultationRecordDAO();
        FamilyMedicalBackgroundDAO familyMedicalBackgroundDAO = new FamilyMedicalBackgroundDAO();
        PatientDetailsLogic patientDetailsLogic = new PatientDetailsLogic();
        Patient patient = new Patient();
        List<ConsultationRecord> consultationRecordList = new ArrayList<ConsultationRecord>();
        List<Medication> currentMedicationList = new ArrayList<Medication>();
        List<FamilyMedicalBackground> familyMedicalBackgroundList = new ArrayList<FamilyMedicalBackground>();

        System.out.println(patientId + " lala");
        patientId = request.getParameter("patientId");
        System.out.println(patientId + " lala");

        // Get patient details with patient id
        patient = patientDAO.getPatientByPatientId(patientId);
        // Get patient's consultation list
        consultationRecordList = consultationRecordDAO.getConsultationRecordListByPatientId(patientId);
        //  Get current medication
        currentMedicationList = patientDetailsLogic.getCurrentMedicationList(consultationRecordList);
        //  Get family medical background list
        familyMedicalBackgroundList = familyMedicalBackgroundDAO.getFamilyMedicalBackgroundListByPatientId(patientId);

        // Set patient attribute in the request
        request.setAttribute("patient", patient);
        //  Set consultationrecord list attribute in the request
        request.setAttribute("consultationList", consultationRecordList);
        //  Set currentMedication list attribute in the request
        request.setAttribute("currentMedicationList", currentMedicationList);
        //  Set familyBackground list attribtue in the request
        request.setAttribute("familyMedicalBackgroundList", familyMedicalBackgroundList);

        //  Forward request to patientDetails.jsp
        getServletContext().getRequestDispatcher("/patientDetails.jsp").forward(request, response);

    }
}
