package Controller;


import DAO.medicationDAO;
import Entity.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;

/**
 * Created by qingyutan on 13/12/16.
 */
@WebServlet(name = "NewMedicationServlet", urlPatterns = "/addNewMedication")
public class NewMedicationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        medicationDAO medication = new medicationDAO();


        String productName = request.getParameter("productname");
        String productType = request.getParameter("producttype");
        String productUnit = request.getParameter("productunit");
        int productQuantity = Integer.valueOf(request.getParameter("productquantity"));
        Double productPrice = Double.valueOf(request.getParameter("productprice"));
        String productDetails = request.getParameter("productdetails");
        String supplierName = request.getParameter("suppliername");
        int supplierPartNo = Integer.valueOf(request.getParameter("supplierpartno"));
        Double supplierPrice = Double.valueOf(request.getParameter("supplierprice"));
        Date importedDate = Date.valueOf(request.getParameter("importeddate"));
        String productCode = request.getParameter("productcode");

        boolean isCreated = medication.addNewMedications(productName, productType, productUnit, productQuantity, productPrice, productDetails, supplierName, supplierPartNo, supplierPrice, importedDate, productCode);
        //request.setAttribute("products" , p);

        if(isCreated == true) {
            getServletContext().getRequestDispatcher("/viewMedication.jsp").forward(request, response);

        } else {
            getServletContext().getRequestDispatcher("/addMedications.jsp").forward(request,response);
        }




    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
