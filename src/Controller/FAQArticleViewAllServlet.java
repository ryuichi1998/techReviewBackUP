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
import java.util.ArrayList;
import java.util.List;

/**
 * Created by qingyutan on 2/2/17.
 */
@WebServlet(name = "FAQArticleViewAllServlet" , urlPatterns = "/viewAllArticle")
public class FAQArticleViewAllServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String staffId = "S003";
        System.out.println(staffId);
        Staff staff;
        StaffDAO staffDAO = new StaffDAO();
        FaqDAO FDAO = new FaqDAO();

        // List
        List<Faq> allArticles = new ArrayList<Faq>();


        //  Get staff
        staff = staffDAO.getStaffByStaffId(staffId);

        // Retrieve all the article
        allArticles = FDAO.retrieveAllArticles();

        // Set parameters
        request.getSession().setAttribute("person", staff);
        request.getSession().setAttribute("id", staff.getStaffId());
        request.getSession().setAttribute("name", staff.getName());
        request.setAttribute("articles", allArticles);


        getServletContext().getRequestDispatcher("/viewAllArticle.jsp").forward(request,response);


    }
}
