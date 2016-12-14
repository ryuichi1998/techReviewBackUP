package Controller;


import DAO.productDAO;
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
@WebServlet(name = "ViewMedicationServlet", urlPatterns = "/viewMedications")
public class ViewMedicationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            try {

                String productCode = request.getParameter("productcode");

                if(productCode != null) {
                    productDAO db = new productDAO();
                    Product medications = db.retrieveMedicationDetails(productCode);

                    request.setAttribute("product", medications);
                    getServletContext().getRequestDispatcher("/productDetails.jsp").forward(request,response);
                }

            } catch (Exception e) {
                throw new ServletException(e);
            }
    }

}
