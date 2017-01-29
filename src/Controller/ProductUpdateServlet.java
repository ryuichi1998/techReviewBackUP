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
@WebServlet(name = "ProductUpdateServlet" , urlPatterns = "/updateProduct")
public class ProductUpdateServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        /*

            FROM viewProduct.jsp to /updateProduct


         */

        String staffId = "S003";
        System.out.println(staffId);

        Staff staff;
        StaffDAO staffDAO = new StaffDAO();
        ProductDAO productDAO = new ProductDAO();


        // variable
        List<Product> productList = new ArrayList<Product>();
        Product productUpdateObj = new Product();
        String productCode = request.getParameter("productcode");

        //  Get staff
        staff = staffDAO.getStaffByStaffId(staffId);


        // get product base on product code
        productUpdateObj = productDAO.retrieveProductDetails(productCode);


        //  Set Session Attributes
        request.getSession().setAttribute("person", staff);
        request.getSession().setAttribute("id", staff.getStaffId());
        request.getSession().setAttribute("name", staff.getName());
        request.setAttribute("productObj", productUpdateObj);

        request.getRequestDispatcher("updateProduct.jsp").forward(request,response);
    }
}
