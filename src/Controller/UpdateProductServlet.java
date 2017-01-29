package Controller;

import DAO.ProductDAO;
import DAO.StaffDAO;
import Entity.Product;
import Entity.Staff;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by qingyutan on 29/1/17.
 */
@WebServlet(name = "UpdateProductServlet" , urlPatterns = "/updateProducts")
public class UpdateProductServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

          /*

            FROM updateProduct.jsp to /updateProduct


         */


        String staffId = "S003";
        System.out.println(staffId);

        Staff staff;
        StaffDAO staffDAO = new StaffDAO();
        ProductDAO PDAO = new ProductDAO();


        // variable
        List<Product> productList = new ArrayList<Product>();
        Product productUpdateObj = new Product();
        String productCode = request.getParameter("productcode");

        //  Get staff
        staff = staffDAO.getStaffByStaffId(staffId);


        // get form parameters
        String pname = request.getParameter("productname");
        String ptype = request.getParameter("producttype");
        String punit = request.getParameter("productunit");
        int pquantity = Integer.parseInt(request.getParameter("productquantity"));
        double pprice = Double.parseDouble(request.getParameter("productprice"));
        String pdetails = request.getParameter("productdetails");
        String sname = request.getParameter("suppliername");
        int spartno = Integer.parseInt(request.getParameter("supplierpartno"));
        double sprice = Double.parseDouble(request.getParameter("supplierprice"));


        try {

            boolean isUpdated = false;

            // Check if field is blank
            // and check if product is existed
            boolean isProductNameBlank = (PDAO.isFieldBlank(pname));
            boolean isProductTypeBlank = PDAO.isFieldBlank(ptype);
            boolean isProductUnitBlank = PDAO.isFieldBlank(punit);
            boolean isProductQuantityBlank = PDAO.isFieldBlank(String.valueOf(pquantity));
            boolean isProductPriceBlank = PDAO.isFieldBlank(String.valueOf(pprice));
            boolean isProductDetailsBlank = PDAO.isFieldBlank(pdetails);
            boolean isProductSupplierNameBlank = PDAO.isFieldBlank(sname);
            boolean isProductSupplierPartNoBlank = PDAO.isFieldBlank(String.valueOf(spartno));
            boolean isProductSupplierPriceBlank = PDAO.isFieldBlank(String.valueOf(sprice));

            System.out.println("Product name is not empty: " + isProductNameBlank);
            System.out.println("Product type is not  empty: " + isProductTypeBlank);
            System.out.println("Product unit is not  empty: " + isProductUnitBlank);
            System.out.println("Product quantity is not  empty: " + isProductQuantityBlank);
            System.out.println("Product price is not  empty: " + isProductPriceBlank);
            System.out.println("Product details is not empty: " + isProductDetailsBlank);
            System.out.println("Product supplier name is not  empty: " + isProductSupplierNameBlank);
            System.out.println("Product supplier part no is not empty: " + isProductSupplierPartNoBlank);
            System.out.println("Product supplier price is not empty: " + isProductSupplierPriceBlank);


            if (!isProductNameBlank || !isProductTypeBlank || !isProductUnitBlank || !isProductPriceBlank
                    || !isProductDetailsBlank || !isProductSupplierNameBlank || !isProductSupplierPartNoBlank || !isProductSupplierPriceBlank) {

                response.sendRedirect("#");
            } else {

                // UPDATE PRODUCT Unable work

               // Product product = new Product(pname, ptype, punit, pquantity, pprice, pdetails, sname, spartno, sprice);
               // isUpdated = PDAO.updateProduct(product);

                if(isUpdated == true) {
                    getServletContext().getRequestDispatcher("/viewProducts?productcode=" + productCode).forward(request, response);
                } else {
                    getServletContext().getRequestDispatcher("/updateProduct?productcode=" + productCode).forward(request, response);
                }

            }
        } catch (Exception e) {
            e.printStackTrace();
        }





    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
