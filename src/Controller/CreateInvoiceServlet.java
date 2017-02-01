package Controller;

import DAO.PatientDAO;
import DAO.ServiceDAO;
import Entity.Patient;
import Entity.Service;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * Created by Ryuichi on 30/1/2017.
 */
@WebServlet(name = "CreateInvoiceServlet", urlPatterns = "/createInvoice")
public class CreateInvoiceServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String desc = request.getParameter("desc");
        String code = request.getParameter("code");
        String servD = request.getParameter("servD");
        String price = request.getParameter("price");
        String Quantity = request.getParameter("quantity");
        System.out.print(desc);
        System.out.print(code);
        System.out.print(servD);
        System.out.print(Quantity);
        System.out.print(price);
        System.out.print("ASD");

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    try{

        PatientDAO db = new PatientDAO();
        List<Patient> list = db.retrieveAllPatient();
        request.setAttribute("patients", list);

        ServiceDAO dbSer = new ServiceDAO();
        List<Service> serviceList = dbSer.retrieveAllService();
        request.setAttribute("services", serviceList);
        for (int i =6; i > 12; i++) {
            Service service = serviceList.get(i);
            System.out.print(service.getSerDesc());
        }

        getServletContext().getRequestDispatcher("/createInvoice.jsp").forward(request, response);

    } catch (Exception e) {
        e.printStackTrace();
        throw new ServletException(e);
    }
    }

}

