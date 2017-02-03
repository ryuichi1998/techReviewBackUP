package Controller;

import DAO.FaqDAO;
import DAO.ProductDAO;
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
@WebServlet(name = "FAQArticleCreateServlet", urlPatterns = "/createArticle")
public class FAQArticleCreateServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        FaqDAO FDAO = new FaqDAO();

        // check if it saved
        boolean IsItSaved = false;

        try {

            // retrieve form data
            String articleName = request.getParameter("subjecttitle");
            String articleShortDesc = request.getParameter("shortdesc");
            String articleLongDesc = request.getParameter("longdesc");

            // auto increment counter
            int currentArticleID = FDAO.retrieveLatestArticleID();
            int nextArticleID = (currentArticleID+1);

            // store details into object
            Faq completeArticle = new Faq(articleName,articleShortDesc,articleLongDesc,nextArticleID);

            IsItSaved = FDAO.createNewArticle(completeArticle);

            if(IsItSaved == true) {
              //  response.sendRedirect("/viewAllArticle?productcode=" + newProductCode);
                response.sendRedirect("/viewAllArticle");
            } else {
                System.out.println("Failed");
            }


        } catch(Exception e){
            // trace all errors
            e.printStackTrace();
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {



        String staffId = "S003";
        System.out.println(staffId);

        Staff staff;
        StaffDAO staffDAO = new StaffDAO();
        ProductDAO PDAO = new ProductDAO();

        //  Get staff
        staff = staffDAO.getStaffByStaffId(staffId);

    }
}
