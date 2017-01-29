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
 * Created by qingyutan on 14/12/16.
 */
@WebServlet(name = "ViewProductServlet", urlPatterns = "/viewProduct")
public class ViewProductServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            try {

                String productCode = request.getParameter("productcode");

                if(productCode != null) {
                    ProductDAO db = new ProductDAO();
                    Product medications = db.retrieveProductDetails(productCode);

                    request.setAttribute("product", medications);
                    request.setAttribute("productCode", productCode);
                    getServletContext().getRequestDispatcher("/productDetails.jsp").forward(request,response);
                }

            } catch (Exception e) {
                throw new ServletException(e);
            }
    }

}
