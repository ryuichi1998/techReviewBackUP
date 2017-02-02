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
        String servDate = request.getParameter("servDateText");
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

        System.out.println(patientId);
        System.out.println(code);
        System.out.println(price);
        System.out.println(servDate);
        System.out.println(quantity);
        System.out.println(date);
        System.out.println(dueDate);

        InvoiceDAO invoiceDb = new InvoiceDAO();
        Invoice invoice = new Invoice();

        PatientDAO patientDb = new PatientDAO();
        Patient patient = new Patient();
        patient = patientDb.getPatientByPatientId(patientId);

        invoice.setPatientByPatientId(patient);
        invoice.setBillingDate(sqlDate);
        invoice.setDueDate(sqlDueDate);
        invoice.setPaymentMethod("Payment Pending");
        invoice.setStatus("Pending");
        invoice.setSubTotal(BigDecimal.valueOf(total));
        invoice.setTax(BigDecimal.valueOf(tax));
        invoice.setSubsidy(BigDecimal.valueOf(sub));
        invoice.setTotalPay(BigDecimal.valueOf(tPayable));
        Invoice i = invoiceDb.createInvoice(invoice);
        Invoice latestInvoice = new Invoice();
        latestInvoice = invoiceDb.getLatest();
        System.out.println(latestInvoice.getInvoiceId());
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

