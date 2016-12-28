package Controller;

import Entity.Patient;
import Entity.Person;
import Utils.DateFormatter;

import javax.print.Doc;
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
        Character personType = ((String) session.getAttribute("id")).charAt(0);
        Patient patient;
        int age = 0;
        String imageSrcURL, imageSrcEncoded;
        Boolean isPatient = false;

        //  Format the date
        age = DateFormatter.getAge(person.getDateOfBirth());

        //  Determine patient/doctor
        if (personType == 'P') {
            isPatient = true;
        } else {
            isPatient = false;
        }

        System.out.println(isPatient);

        //  Get the image source
        imageSrcEncoded = new String(Base64.getEncoder().encode(person.getProfileImage()));
        imageSrcURL = "data:image/png;base64," + imageSrcEncoded;
        //  If there is not image stored in the db, get the image path from the default
        if(imageSrcEncoded == null){
            imageSrcURL = "common/images/defaultIcon.png";
        }

        request.setAttribute("age", age);
        request.setAttribute("imageSrcURL", imageSrcURL);
        request.setAttribute("isPatient", isPatient);

        getServletContext().getRequestDispatcher("/profile.jsp").forward(request, response);
    }
}
