package Controller;

import DAO.AppointmentDAO;
import DAO.StaffDAO;
import Entity.Appointment;
import Entity.Staff;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

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

        List<Appointment> appointmentList, todayAppointmentList;
        Staff staff;

        StaffDAO staffDAO = new StaffDAO();
        AppointmentDAO appointmentDAO = new AppointmentDAO();

        //  Get staff
        staff = staffDAO.getStaffByStaffId(staffId);
        //  Get all appointment
        appointmentList = appointmentDAO.getAppointmentListByDoctorId(staffId);
        //  Get today appointment
        todayAppointmentList = appointmentDAO.getTodayAppointmentListByDoctorId(staffId);

        //  Set Session Attributes
        request.getSession().setAttribute("person", staff);
        request.getSession().setAttribute("id", staff.getStaffId());
        request.getSession().setAttribute("name", staff.getName());

        //  Set request attributes
        request.setAttribute("appointmentList", appointmentList);
        request.setAttribute("todayAppointmentList", todayAppointmentList);

        getServletContext().getRequestDispatcher("/doctorDashboard.jsp").forward(request, response);
    }
}
