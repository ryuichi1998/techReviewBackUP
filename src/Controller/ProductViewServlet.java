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
 * Created by qingyutan on 30/12/16.
 */
@WebServlet(name = "ProductViewServlet" , urlPatterns = "/viewProducts")
public class ProductViewServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String staffId = "S003";
        System.out.println(staffId);

        Staff staff;
        StaffDAO staffDAO = new StaffDAO();
        ProductDAO productDAO = new ProductDAO();


        // variable
        List<Product> productList = new ArrayList<Product>();

        //  Get staff
        staff = staffDAO.getStaffByStaffId(staffId);


        // retrieve all products

        productList = productDAO.retrieveAllProduct();


        //  Set Session Attributes
        request.getSession().setAttribute("person", staff);
        request.getSession().setAttribute("id", staff.getStaffId());
        request.getSession().setAttribute("name", staff.getName());
        request.setAttribute("products", productList);

        request.getRequestDispatcher("viewProduct.jsp").forward(request,response);

    }
}
