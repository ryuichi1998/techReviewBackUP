package Controller;

import Entity.Person;
import Utils.DateFormatter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Base64;

/**
 * Created by liyun on 10/12/16.
 */
@WebServlet(name = "ProfileServlet", urlPatterns = "/profile")
public class ProfileServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();

        Person person = (Person) session.getAttribute("person");
        int age = 0;
        String imageSrcURL, imageSrcEncoded;

        age = DateFormatter.getAge(person.getDateOfBirth());
        imageSrcEncoded = new String(Base64.getEncoder().encode(person.getProfileImage()));
        imageSrcURL = "data:image/png;base64," + imageSrcEncoded;


        request.setAttribute("age", age);
        request.setAttribute("imageSrcURL", imageSrcURL);
        getServletContext().getRequestDispatcher("/profile.jsp").forward(request, response);
    }
}
