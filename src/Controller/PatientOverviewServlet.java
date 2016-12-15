package Controller;

import DAO.ConsultationRecordDAO;
import DAO.VitalSignsDAO;
import Entity.Patient;
import Entity.Staff;
import Entity.VitalSigns;
import Logic.PatientOverviewLogic;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.*;

/**
 * Created by liyun on 11/12/16.
 */
@WebServlet(name = "PatientOverviewServlet", urlPatterns = "/patientOverview")
public class PatientOverviewServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        ConsultationRecordDAO consultationRecordDAO = new ConsultationRecordDAO();
        VitalSignsDAO vitalSignsDAO = new VitalSignsDAO();
        PatientOverviewLogic patientOverviewLogic = new PatientOverviewLogic();

        List<VitalSigns> vitalSignsList = new ArrayList<VitalSigns>();
        HashMap<String, List<VitalSigns>> patientVitalSignMap = new HashMap<String, List<VitalSigns>>();
        HashMap<String, List<VitalSigns>> avgPatientVitalSignMap = new HashMap<String, List<VitalSigns>>();
        Iterator iterator;

        //  Get doctor in charge
        Staff doctor = (Staff) request.getSession().getAttribute("person");

        //  Get all patients under doctor in charge
        List<Patient> patientListByDoctorId = consultationRecordDAO.getPatientListByDoctorId(doctor.getStaffId());
        //  Get patient's vital signs list
        for (Patient patient : patientListByDoctorId) {
            vitalSignsList = vitalSignsDAO.getVitalSignListByPatientId(patient.getPatientId());
            patientVitalSignMap.put(patient.getPatientId(), vitalSignsList);
        }

        //  Calculate average
        System.out.println(patientVitalSignMap.size() + " lalasize");
        for (Map.Entry<String, List<VitalSigns>> entry : patientVitalSignMap.entrySet()) {
            System.out.println("Key = " + entry.getKey() + ", Value = " + entry.getValue());
        }
        iterator = patientVitalSignMap.entrySet().iterator();
        while (iterator.hasNext()) {
            System.out.println("Iam here");
            Map.Entry pair = (Map.Entry) iterator.next();
            avgPatientVitalSignMap.put((String) pair.getKey(), patientOverviewLogic.getAverageVitalSignByPatientVitalSignList((List<VitalSigns>) pair.getValue()));
        }

        request.getSession().setAttribute("patientList", patientListByDoctorId);
        request.getSession().setAttribute("avgPatientVitalSignMap", avgPatientVitalSignMap);

        //  Forward to patient overview page
        getServletContext().getRequestDispatcher("/patientOverview.jsp").forward(request, response);
    }
}
