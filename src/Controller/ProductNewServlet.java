package Controller;

import DAO.ProductDAO;
import Entity.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by qingyutan on 30/12/16.
 */
@WebServlet(name = "ProductNewServlet", urlPatterns = "/newProduct")
public class ProductNewServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


       /*

        Version 1.0
        Updated on 30th December 2016
        Changes:
         1.1 Check is every field is valid before allowing it to persist.
         1.2 Product code retrieves from the previous number and add one
         1.3 Date is fixed

        What is not working:
         1.1 Unable to check if current product is existed via name (Line 57)

        */

        boolean isCreated = false;

        try {

            // Instantiate DAO
            ProductDAO PDAO = new ProductDAO();


            // Get form variables
            String pname = request.getParameter("productname");
            String ptype = request.getParameter("producttype");
            String punit = request.getParameter("productunit");
            int pquantity = Integer.parseInt(request.getParameter("productquantity"));
            double pprice = Double.parseDouble(request.getParameter("productprice"));
            String pdetails = request.getParameter("productdetails");
            String sname = request.getParameter("suppliername");
            int spartno = Integer.parseInt(request.getParameter("supplierpartno"));
            double sprice = Double.parseDouble(request.getParameter("supplierprice"));


            // Check if field is blank
            // and check if product is existed
            boolean isProductNameBlank = (PDAO.isFieldBlank(pname) || PDAO.isProductExisted(pname));
            boolean isProductTypeBlank = PDAO.isFieldBlank(ptype);
            boolean isProductUnitBlank = PDAO.isFieldBlank(punit);
            boolean isProductQuantityBlank = PDAO.isFieldBlank(String.valueOf(pquantity));
            boolean isProductPriceBlank = PDAO.isFieldBlank(String.valueOf(pprice));
            boolean isProductDetailsBlank = PDAO.isFieldBlank(pdetails);
            boolean isProductSupplierNameBlank = PDAO.isFieldBlank(sname);
            boolean isProductSupplierPartNoBlank = PDAO.isFieldBlank(String.valueOf(spartno));
            boolean isProductSupplierPriceBlank = PDAO.isFieldBlank(String.valueOf(sprice));

//            System.out.println("Product name is not empty: " + isProductNameBlank);
//            System.out.println("Product type is not  empty: " + isProductTypeBlank);
//            System.out.println("Product unit is not  empty: " + isProductUnitBlank);
//            System.out.println("Product quantity is not  empty: " + isProductQuantityBlank);
//            System.out.println("Product price is not  empty: " + isProductPriceBlank);
//            System.out.println("Product details is not empty: " + isProductDetailsBlank);
//            System.out.println("Product supplier name is not  empty: " + isProductSupplierNameBlank);
//            System.out.println("Product supplier part no is not empty: " + isProductSupplierPartNoBlank);
//            System.out.println("Product supplier price is not empty: " + isProductSupplierPriceBlank);



            if (!isProductNameBlank || !isProductTypeBlank || !isProductUnitBlank || !isProductPriceBlank
                    || !isProductDetailsBlank || !isProductSupplierNameBlank || !isProductSupplierPartNoBlank || !isProductSupplierPriceBlank) {

                response.sendRedirect("addProduct.jsp");
            } else {

                // get current system time
                java.util.Date utilDate = new java.util.Date();

                // convert to sql date
                java.sql.Date registeredDate = new java.sql.Date(utilDate.getTime());

                // get product code
                String productCodeValue = PDAO.createProductCode();
                String newProductCode = ("E" + (Integer.parseInt(productCodeValue.substring(1, productCodeValue.length()))+1));
                System.out.println(newProductCode);

                Product product = new Product(pname, ptype, punit, pquantity, pprice, pdetails, sname, spartno, sprice, registeredDate, newProductCode);
                isCreated = PDAO.addNewProduct(product);



                if (isCreated == true) {
                    response.sendRedirect("/viewProducts?productcode=" + newProductCode);
                } else {
                    response.sendRedirect("/viewProduct?productcode=" + newProductCode);
                }
            }

            } catch(NumberFormatException e){ e.printStackTrace(); }


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
