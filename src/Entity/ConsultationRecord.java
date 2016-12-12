package Entity;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import java.sql.Timestamp;

/**
 * Created by liyun on 10/12/16.
 */
@Entity
public class ConsultationRecord {
    private int consultationId;
    private Integer patientId;
    private Integer doctorInCharge;
    private Timestamp dateTime;
    private String illness;

    @Id
    @Column(name = "consultationId", nullable = false)
    public int getConsultationId() {
        return consultationId;
    }

    public void setConsultationId(int consultationId) {
        this.consultationId = consultationId;
    }

    @Basic
    @Column(name = "patientId", nullable = true)
    public Integer getPatientId() {
        return patientId;
    }

    public void setPatientId(Integer patientId) {
        this.patientId = patientId;
    }

    @Basic
    @Column(name = "doctorInCharge", nullable = true)
    public Integer getDoctorInCharge() {
        return doctorInCharge;
    }

    public void setDoctorInCharge(Integer doctorInCharge) {
        this.doctorInCharge = doctorInCharge;
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
    @Column(name = "illness", nullable = true, length = 45)
    public String getIllness() {
        return illness;
    }

    public void setIllness(String illness) {
        this.illness = illness;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        ConsultationRecord that = (ConsultationRecord) o;

        if (consultationId != that.consultationId) return false;
        if (patientId != null ? !patientId.equals(that.patientId) : that.patientId != null) return false;
        if (doctorInCharge != null ? !doctorInCharge.equals(that.doctorInCharge) : that.doctorInCharge != null)
            return false;
        if (dateTime != null ? !dateTime.equals(that.dateTime) : that.dateTime != null) return false;
        if (illness != null ? !illness.equals(that.illness) : that.illness != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = consultationId;
        result = 31 * result + (patientId != null ? patientId.hashCode() : 0);
        result = 31 * result + (doctorInCharge != null ? doctorInCharge.hashCode() : 0);
        result = 31 * result + (dateTime != null ? dateTime.hashCode() : 0);
        result = 31 * result + (illness != null ? illness.hashCode() : 0);
        return result;
    }
}
