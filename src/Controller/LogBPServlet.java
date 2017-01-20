package Controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by liyun on 1/1/17.
 */
@WebServlet(name = "LogBPServlet", urlPatterns = "/logBP")
public class LogBPServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String dateTimeBP, foodBP, medicationBP, systotic, diastolic;

        dateTimeBP = (String) request.getParameter("dateTimeBP");
        foodBP = (String) request.getParameter("foodBP");
        medicationBP = (String) request.getParameter("medicationBP");
        systotic = (String) request.getParameter("systotic");
        diastolic = (String) request.getParameter("diastolic");

        System.out.println(dateTimeBP + " " + foodBP + " " + medicationBP + " " + systotic + " " + diastolic);


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
