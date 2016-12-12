package Entity;

import javax.persistence.*;
import java.sql.Timestamp;

/**
 * Created by liyun on 13/12/16.
 */
@Entity
public class Appointment {
    private int appointmentId;
    private Timestamp dateTime;
    private String cancelReason;
    private Patient patientByPatientId;
    private Staff doctorByStaffId;

    @Id
    @Column(name = "appointmentId", nullable = false)
    public int getAppointmentId() {
        return appointmentId;
    }

    public void setAppointmentId(int appointmentId) {
        this.appointmentId = appointmentId;
    }

    @Basic
    @Column(name = "dateTime", nullable = true)
    public Timestamp getDateTime() {
        return dateTime;
    }

    public void setDateTime(Timestamp dateTime) {
        this.dateTime = dateTime;
    }

    @Basic
    @Column(name = "cancelReason", nullable = true, length = 45)
    public String getCancelReason() {
        return cancelReason;
    }

    public void setCancelReason(String cancelReason) {
        this.cancelReason = cancelReason;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Appointment that = (Appointment) o;

        if (appointmentId != that.appointmentId) return false;
        if (dateTime != null ? !dateTime.equals(that.dateTime) : that.dateTime != null) return false;
        if (cancelReason != null ? !cancelReason.equals(that.cancelReason) : that.cancelReason != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = appointmentId;
        result = 31 * result + (dateTime != null ? dateTime.hashCode() : 0);
        result = 31 * result + (cancelReason != null ? cancelReason.hashCode() : 0);
        return result;
    }

    @ManyToOne
    @JoinColumn(name = "patientId", referencedColumnName = "patientId")
    public Patient getPatientByPatientId() {
        return patientByPatientId;
    }

    public void setPatientByPatientId(Patient patientByPatientId) {
        this.patientByPatientId = patientByPatientId;
    }

    @ManyToOne
    @JoinColumn(name = "doctorInCharge", referencedColumnName = "staffId")
    public Staff getDoctorByStaffId() {
        return doctorByStaffId;
    }

    public void setDoctorByStaffId(Staff doctorByStaffId) {
        this.doctorByStaffId = doctorByStaffId;
    }
}
