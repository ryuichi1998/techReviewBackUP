package Entity;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Collection;

/**
 * Created by liyun on 13/12/16.
 */
@Entity
public class ConsultationRecord {
    private int consultationId;
    private Timestamp dateTime;
    private String illness;
    private String diagnosis;
    private Patient patientByPatientId;
    private Staff staffByDoctorInCharge;
    private Collection<Medication> medicationsByConsultationId;

    @Id
    @Column(name = "consultationId", nullable = false)
    public int getConsultationId() {
        return consultationId;
    }

    public void setConsultationId(int consultationId) {
        this.consultationId = consultationId;
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

    @Basic
    @Column(name = "diagnosis", nullable = true, length = 100)
    public String getDiagnosis() {
        return diagnosis;
    }

    public void setDiagnosis(String diagnosis) {
        this.diagnosis = diagnosis;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        ConsultationRecord that = (ConsultationRecord) o;

        if (consultationId != that.consultationId) return false;
        if (dateTime != null ? !dateTime.equals(that.dateTime) : that.dateTime != null) return false;
        if (illness != null ? !illness.equals(that.illness) : that.illness != null) return false;
        if (diagnosis != null ? !diagnosis.equals(that.diagnosis) : that.diagnosis != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = consultationId;
        result = 31 * result + (dateTime != null ? dateTime.hashCode() : 0);
        result = 31 * result + (illness != null ? illness.hashCode() : 0);
        result = 31 * result + (diagnosis != null ? diagnosis.hashCode() : 0);
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
    public Staff getStaffByDoctorInCharge() {
        return staffByDoctorInCharge;
    }

    public void setStaffByDoctorInCharge(Staff staffByDoctorInCharge) {
        this.staffByDoctorInCharge = staffByDoctorInCharge;
    }

    @OneToMany(mappedBy = "consultationrecordByConsultationid")
    public Collection<Medication> getMedicationsByConsultationId() {
        return medicationsByConsultationId;
    }

    public void setMedicationsByConsultationId(Collection<Medication> medicationsByConsultationId) {
        this.medicationsByConsultationId = medicationsByConsultationId;
    }
}
