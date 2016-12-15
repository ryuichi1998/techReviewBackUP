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

/**
 * Created by liyun on 10/12/16.
 */
@WebServlet(name = "ProfilePatientServlet", urlPatterns = "/patientProfile")
public class ProfilePatientServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();

        Person person = (Person) session.getAttribute("person");
        int age = 0;

        System.out.println(request.getSession().getAttribute("id") + " is my id");

        age = DateFormatter.getAge(person.getDateOfBirth());

        request.setAttribute("age", age);
        getServletContext().getRequestDispatcher("/patientProfile.jsp").forward(request, response);
    }
}
