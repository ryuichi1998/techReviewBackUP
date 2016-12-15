package Controller;



import DAO.ProductDAO;
import Entity.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

/**
 * Created by qingyutan on 13/12/16.
 */
@WebServlet(name = "NewMedicationServlet", urlPatterns = "/addNewMedication")
public class NewMedicationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        ProductDAO medication = new ProductDAO();
        SimpleDateFormat dtf = new SimpleDateFormat("dd/MM/yyyy");
        java.util.Date currentDate = new java.util.Date();
        String newProductCode = "";



        try {


            newProductCode = medication.createProductCode().getProductCode();

            String pname = request.getParameter("productname");
            String ptype = request.getParameter("producttype");
            String punit = request.getParameter("productunit");
            int pquantity = Integer.parseInt(request.getParameter("productquantity"));
            double pprice = Double.parseDouble(request.getParameter("productprice"));
            String pdetails = request.getParameter("productdetails");
            String sname = request.getParameter("suppliername");
            int spartno = Integer.parseInt(request.getParameter("supplierpartno"));
            double sprice = Double.parseDouble(request.getParameter("supplierprice"));
            //product.setImportedDate(Date.valueOf(request.getParameter("importeddate")));
            //product.setProductCode("E" + Integer.parseInt(newProductCode)+1);

            Product product = new Product(pname, ptype, punit, pquantity, pprice, pdetails, sname, spartno, sprice, newProductCode);
            medication.addNewMedications(product);

            //request.setAttribute("products", product);
            getServletContext().getRequestDispatcher("/viewMedication.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }




    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
