package Controller;

import DAO.FaqDAO;
import DAO.StaffDAO;
import Entity.Faq;
import Entity.Staff;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by qingyutan on 2/2/17.
 */
@WebServlet(name = "FAQArticleUpdateServlet", urlPatterns = "/updateArticle")
public class FAQArticleUpdateServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            String staffId = "S003";
            //System.out.println(staffId);
            String id = request.getParameter("id");

            Staff staff;
            StaffDAO staffDAO = new StaffDAO();
            FaqDAO FDAO = new FaqDAO();
            Faq articles = new Faq();

            //  Get staff
            staff = staffDAO.getStaffByStaffId(staffId);





            // Retrieve articles
            if (id != null) {

                int articleID = Integer.parseInt(id);

                Faq selectedArticle = FDAO.retrieveArticleDetails(articleID);

                request.setAttribute("articleID", articleID);
                request.setAttribute("article", selectedArticle);
                request.getSession().setAttribute("person", staff);
                request.getSession().setAttribute("id", staff.getStaffId());
                request.getSession().setAttribute("name", staff.getName());


                getServletContext().getRequestDispatcher("/updateArticle.jsp").forward(request, response);
            }

        } catch(Exception e) {
            e.printStackTrace();
        }

    }
}
