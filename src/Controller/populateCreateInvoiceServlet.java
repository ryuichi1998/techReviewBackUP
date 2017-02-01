package Controller;

import DAO.PatientDAO;
import Entity.Patient;
import org.codehaus.jackson.map.ObjectMapper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Ryuichi on 1/2/2017.
 */
@WebServlet(name = "populateCreateInvoiceServlet", urlPatterns = "/populateCreateInvoice")
public class populateCreateInvoiceServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String patientId = request.getParameter("patientId");
        boolean click = Boolean.parseBoolean(request.getParameter("clickPatientId"));

        if (click) {
            PatientDAO db = new PatientDAO();
            Patient patient = db.getPatientByPatientId(patientId);
            System.out.print(patient);
            ObjectMapper mapper = new ObjectMapper();
            response.setContentType("application/json");
            mapper.writeValue(response.getOutputStream(), patient);
        }

        else {

        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
