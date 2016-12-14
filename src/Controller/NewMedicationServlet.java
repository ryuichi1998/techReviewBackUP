package Controller;



import DAO.productDAO;
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

        productDAO medication = new productDAO();


        try {
            String productName = request.getParameter("productname");
            String productType = request.getParameter("producttype");
            String productUnit = request.getParameter("productunit");
            int productQuantity = Integer.parseInt(request.getParameter("productquantity"));
            Double productPrice = Double.parseDouble(request.getParameter("productprice"));
            String productDetails = request.getParameter("productdetails");
            String supplierName = request.getParameter("suppliername");
            int supplierPartNo = Integer.parseInt(request.getParameter("supplierpartno"));
            Double supplierPrice = Double.parseDouble(request.getParameter("supplierprice"));
            Date importedDate = Date.valueOf(request.getParameter("importeddate"));
            String productCode = request.getParameter("productcode");

            Product prod = medication.addNewMedications(productName, productType, productUnit, productQuantity, productPrice, productDetails, supplierName, supplierPartNo, supplierPrice, importedDate, productCode);

            request.setAttribute("products", prod);
            getServletContext().getRequestDispatcher("/viewMedication.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }




    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
