package Controller;

import DAO.InvoiceDAO;
import DAO.PatientDAO;
import DAO.ServiceDAO;
import Entity.Invoice;
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
 * Created by Ryuichi on 3/2/2017.
 */
@WebServlet(name = "ViewInvoiceServlet", urlPatterns = "/viewInvoice")
public class ViewInvoiceServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try{

            InvoiceDAO db = new InvoiceDAO();
            List<Invoice> list = db.getInvoiceListByPatientId("P001");
            request.setAttribute("invoices", list);

            getServletContext().getRequestDispatcher("/viewInvoice.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException(e);
        }

    }
}
