package Controller;

import Entity.Product;

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
@WebServlet(name = "ProductDashboardServlet", urlPatterns = "/products")
public class ProductDashboardServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Default Staff
        String staffId = "S003";
        System.out.println(staffId);


        List<Product> LowInStockProducts, newOrdersProducts;


        // Request Dispatcher
        getServletContext().getRequestDispatcher("/productDashboard.jsp").forward(request, response);



    }
}
