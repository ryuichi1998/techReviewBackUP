package Controller;

import DAO.PatientDAO;
import Entity.Patient;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by liyun on 11/12/16.
 */
@WebServlet(name = "PatientDashboardServlet", urlPatterns = "/patientDashboard")
public class PatientDashboardServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      /*  String patientId = null;
        PatientDAO patientDAO = new PatientDAO();
        ConsultationRecordDAO consultationRecordDAO = new ConsultationRecordDAO();
        PatientDetailsLogic patientDetailsLogic = new PatientDetailsLogic();
        Patient patient = new Patient();
        List<ConsultationRecord> consultationRecordList = new ArrayList<ConsultationRecord>();
        List<Medication> currentMedicationList = new ArrayList<Medication>();

        System.out.println(patientId + " lala");
        patientId = request.getParameter("patientId");
        System.out.println(patientId + " lala");

        // Get patient details with patient id
        patient = patientDAO.getPatientByPatientId(patientId);
        // Get patient's consultation list
        consultationRecordList = consultationRecordDAO.getConsultationRecordListByPatientId(patientId);
        //  Get current medication
        currentMedicationList = patientDetailsLogic.getCurrentMedicationList(consultationRecordList);

        // Set patient attribute in the request
        request.setAttribute("patient", patient);
        //  Set consultationrecord list attribute in the request
        request.setAttribute("consultationList", consultationRecordList);
        //  Set currentMedication list attribute in the request
        request.setAttribute("currentMedicationList", currentMedicationList);
*/
        String patientId = "P001";
        Patient patient = new Patient();
        PatientDAO patientDAO = new PatientDAO();

        patient = patientDAO.getPatientByPatientId(patientId);

        request.getSession().setAttribute("person", patient);
        request.getSession().setAttribute("id", patientId);

        //  Forward request to patientDetails.jsp
        getServletContext().getRequestDispatcher("/patientDashboard.jsp").forward(request, response);

    }
}
