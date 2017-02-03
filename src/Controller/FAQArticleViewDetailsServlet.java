package Controller;

import DAO.FaqDAO;
import Entity.Faq;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by qingyutan on 2/2/17.
 */
@WebServlet(name = "FAQArticleViewDetailsServlet", urlPatterns = "/viewArticleDetails")
public class FAQArticleViewDetailsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {

            String id =  request.getParameter("id");

            if(id != null) {
                FaqDAO FDAO = new FaqDAO();
                Faq articleDetails = null;

                int articleID = Integer.parseInt(id);

                Faq selectedArticle = FDAO.retrieveArticleDetails(articleID);

                request.setAttribute("articleID", articleID);
                request.setAttribute("article", selectedArticle);

                getServletContext().getRequestDispatcher("/viewArticleDetails.jsp").forward(request,response);
            }

        } catch (Exception e) {
            throw new ServletException(e);
        }

    }
}
