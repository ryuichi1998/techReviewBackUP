package Controller;

import DAO.InvoiceDAO;
import DAO.PatientDAO;
import DAO.ServDetailsDAO;
import DAO.ServiceDAO;
import Entity.Invoice;
import Entity.Patient;
import Entity.Servdetails;
import Entity.Service;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * Created by Ryuichi on 30/1/2017.
 */
@WebServlet(name = "CreateInvoiceServlet", urlPatterns = "/createInvoice")
public class CreateInvoiceServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try{

        String patientId = request.getParameter("patientId");
        String code = request.getParameter("code");
        String price = request.getParameter("priceText");
        String servDate = request.getParameter("servDate");
        String quantity = request.getParameter("quantity");

        DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
        Date date = new Date();
        Date dueDate = new Date();
        Calendar myCal = Calendar.getInstance();
        myCal.setTime(dueDate);
        myCal.add(Calendar.MONTH, +1);
        dueDate = myCal.getTime();
        java.sql.Date sqlDate = new java.sql.Date(date.getTime());
        java.sql.Date sqlDueDate = new java.sql.Date(dueDate.getTime());

        NumberFormat formatter = new DecimalFormat("#0.00");
        double total = Double.valueOf(formatter.format(  Double.parseDouble(price)* Integer.parseInt(quantity)));
        double tax = Double.valueOf(formatter.format(total*0.07));
        double sub = Double.valueOf(formatter.format(total*0.04));
        double tPayable = Double.valueOf(formatter.format(total+tax-sub));

        InvoiceDAO invoiceDb = new InvoiceDAO();
        Invoice invoice = new Invoice();

        PatientDAO patientDb = new PatientDAO();
        Patient patient = new Patient();

        ServiceDAO serviceDb = new ServiceDAO();
        Service service = new Service();

        invoice.setPatientByPatientId(patientDb.getPatientByPatientId(patientId));
        invoice.setBillingDate(sqlDate);
        invoice.setDueDate(sqlDueDate);
        invoice.setPaymentMethod("Payment Pending");
        invoice.setStatus("Pending");
        invoice.setSubTotal(BigDecimal.valueOf(total));
        invoice.setTax(BigDecimal.valueOf(tax));
        invoice.setSubsidy(BigDecimal.valueOf(sub));
        invoice.setTotalPay(BigDecimal.valueOf(tPayable));
        invoiceDb.createInvoice(invoice);

        ServDetailsDAO servDetailsDb = new ServDetailsDAO();
        Servdetails servDetails = new Servdetails();
        Date dateServDate = dateFormat.parse(servDate);
        java.sql.Date sqlServDate = new java.sql.Date(dateServDate.getTime());
        servDetails.setBillingDate(sqlServDate);
        servDetails.setInvoiceByInvoiceId(invoiceDb.getLatest());
        servDetails.setQnty(Integer.parseInt(quantity));
        servDetails.setSubtotal( BigDecimal.valueOf((  Double.parseDouble(price)* Integer.parseInt(quantity))));
        servDetails.setServiceByServiceId(serviceDb.getService(code));
        servDetailsDb.createServdetails(servDetails);

        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException(e);
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    try{

        PatientDAO db = new PatientDAO();
        List<Patient> list = db.retrieveAllPatient();
        request.setAttribute("patients", list);

        ServiceDAO dbSer = new ServiceDAO();
        List<Service> serviceList = dbSer.retrieveAllService();
        request.setAttribute("services", serviceList);

        getServletContext().getRequestDispatcher("/createInvoice.jsp").forward(request, response);

    } catch (Exception e) {
        e.printStackTrace();
        throw new ServletException(e);
    }
    }

}

