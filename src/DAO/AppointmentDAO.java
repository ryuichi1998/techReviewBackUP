package DAO;

import Entity.Appointment;
import Model.EMF;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.persistence.TemporalType;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * Created by liyun on 26/12/16.
 */
public class AppointmentDAO {

    private EntityManager em;

    public AppointmentDAO() {
        em = EMF.getInstance().createEntityManager();
    }

    //  Get all appointment list by doctorId
    public List<Appointment> getAppointmentListByDoctorId(String doctorId) {
        List<Appointment> appointmentList = new ArrayList<Appointment>();

        try {
            Query query = em.createQuery("SELECT appointment FROM Appointment appointment WHERE appointment.doctorByStaffId.staffId=:doctorId");
            query.setParameter("doctorId", doctorId);

            appointmentList = (List<Appointment>) query.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println(appointmentList.size() + " total appointment");

        return appointmentList;
    }

    //  Get all today's appointment list by doctorId
    public List<Appointment> getTodayAppointmentListByDoctorId(String doctorId){
        List<Appointment> todayAppointmentList = new ArrayList<Appointment>();

        Calendar todayDate = Calendar.getInstance();
        todayDate.set(Calendar.HOUR_OF_DAY, 0);
        todayDate.set(Calendar.MINUTE, 0);
        todayDate.set(Calendar.SECOND, 0);
        todayDate.set(Calendar.MILLISECOND, 0);
        Calendar tmrDate = todayDate;
        tmrDate.add(Calendar.DATE, 1);

        try {
            Query query = em.createQuery("SELECT appointment FROM Appointment appointment WHERE appointment.doctorByStaffId.staffId=:doctorId AND (appointment.dateTime >= :todayDate AND appointment.dateTime < :tmrDate)");
            query.setParameter("doctorId", doctorId);
//            query.setParameter("todayDate", new Date(), TemporalType.DATE);
            query.setParameter("todayDate", todayDate);
            query.setParameter("tmrDate", tmrDate);

            todayAppointmentList = (List<Appointment>) query.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
        }

        System.out.println(new Date() + " is the date");
        System.out.println(todayAppointmentList.size() + " size");
        for(Appointment appointment: todayAppointmentList){
            System.out.println(appointment.getAppointmentId() + " today la");
        }

        return todayAppointmentList;
    }


}
