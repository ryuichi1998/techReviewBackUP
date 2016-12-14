package Controller;

import DAO.StaffDAO;
import Entity.Staff;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by liyun on 11/16/2016.
 */
@WebServlet(name = "DoctorDashboardServlet", urlPatterns = "/doctorDashboard")
public class DoctorDashboardServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String staffId = "S001";
        System.out.print(staffId);

        StaffDAO staffDAO = new StaffDAO();
        Staff staff = staffDAO.getStaffByStaffId(staffId);

        request.getSession().setAttribute("person", staff);
        request.getSession().setAttribute("id", staff.getStaffId());
        System.out.println("thisis my f fsd " + staff.getAddress());

        getServletContext().getRequestDispatcher("/doctorDashboard.jsp").forward(request, response);
    }
}
