package Controller;

import DAO.StaffDAO;
import Entity.Product;
import Entity.Staff;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * Created by qingyutan on 30/12/16.
 */
@WebServlet(name = "ProductDashboardServlet", urlPatterns = "/productDashboard")
public class ProductDashboardServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Default Staff
        String staffId = "S003";
        System.out.println(staffId);

        Staff staff;
        StaffDAO staffDAO = new StaffDAO();

        //  Get staff
        staff = staffDAO.getStaffByStaffId(staffId);

        //  Set Session Attributes
        request.getSession().setAttribute("person", staff);
        request.getSession().setAttribute("id", staff.getStaffId());
        request.getSession().setAttribute("name", staff.getName());


        List<Product> LowInStockProducts, newOrdersProducts;


        // Request Dispatcher
        getServletContext().getRequestDispatcher("/productDashboard.jsp").forward(request, response);



    }
}
