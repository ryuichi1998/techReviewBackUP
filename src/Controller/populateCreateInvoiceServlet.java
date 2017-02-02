package Controller;

import DAO.PatientDAO;
import DAO.ServiceDAO;
import Entity.Patient;
import Entity.Service;
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

        boolean click = Boolean.parseBoolean(request.getParameter("clickPatientId"));

        if (click) {
            String patientId = request.getParameter("patientId");
            PatientDAO db = new PatientDAO();
            Patient patient = db.getPatientByPatientId(patientId);
            ObjectMapper mapper = new ObjectMapper();
            response.setContentType("application/json");
            mapper.writeValue(response.getOutputStream(), patient);
        }

        else {
            String serviceId = request.getParameter("serviceId");
            System.out.print(serviceId);
            ServiceDAO db = new ServiceDAO();
            Service service = db.getService(serviceId);
            ObjectMapper mapper = new ObjectMapper();
            response.setContentType("application/json");
            mapper.writeValue(response.getOutputStream(), service);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
