package Controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Ryuichi on 15/12/2016.
 */
@WebServlet(name = "PaymentServlet", urlPatterns = "/payment")
public class PaymentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        try {
//            ServiceDAO db = new ServiceDAO();
//            List<Service> list = db.retrieveAllService("P001");
//            System.out.println(list.get(0).getServiceFee() + "  test");
//            request.setAttribute("services", list);
//            getServletContext().getRequestDispatcher("/test.jsp").forward(request, response);
//        } catch (Exception e) {
//            e.printStackTrace();
//            throw new ServletException(e);
//        }
//    }
}
