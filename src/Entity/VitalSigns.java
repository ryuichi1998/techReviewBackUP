package Entity;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Date;

/**
 * Created by liyun on 1/1/17.
 */
@Entity
public class VitalSigns {
    private String data;
    private String type;
    private Timestamp dataTime;
    private String remarks;
    private int vitalSignId;
    private String status;
    private String medicationTaken;
    private String foodStatus;
    private Patient patientByPatientId;

    @Basic
    @Column(name = "data", nullable = true, precision = 0)
    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }

    @Basic
    @Column(name = "type", nullable = true, length = 45)
    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    @Basic
    @Column(name = "dataTime", nullable = true)
    public Timestamp getDataTime() {
        return dataTime;
    }

    public void setDataTime(Timestamp dataTime) {
        this.dataTime = dataTime;
    }

    @Basic
    @Column(name = "remarks", nullable = true, length = 45)
    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    @Id
    @Column(name = "vitalSignId", nullable = false)
    public int getVitalSignId() {
        return vitalSignId;
    }

    public void setVitalSignId(int vitalSignId) {
        this.vitalSignId = vitalSignId;
    }

    @Basic
    @Column(name = "status", nullable = true, length = 45)
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Basic
    @Column(name = "medicationTaken", nullable = true, length = 1)
    public String getMedicationTaken() {
        return medicationTaken;
    }

    public void setMedicationTaken(String medicationTaken) {
        this.medicationTaken = medicationTaken;
    }

    @Basic
    @Column(name = "foodStatus", nullable = true, length = 1)
    public String getFoodStatus() {
        return foodStatus;
    }

    public void setFoodStatus(String foodStatus) {
        this.foodStatus = foodStatus;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        VitalSigns that = (VitalSigns) o;

        if (vitalSignId != that.vitalSignId) return false;
        if (data != null ? !data.equals(that.data) : that.data != null) return false;
        if (type != null ? !type.equals(that.type) : that.type != null) return false;
        if (dataTime != null ? !dataTime.equals(that.dataTime) : that.dataTime != null) return false;
        if (remarks != null ? !remarks.equals(that.remarks) : that.remarks != null) return false;
        if (status != null ? !status.equals(that.status) : that.status != null) return false;
        if (medicationTaken != null ? !medicationTaken.equals(that.medicationTaken) : that.medicationTaken != null)
            return false;
        if (foodStatus != null ? !foodStatus.equals(that.foodStatus) : that.foodStatus != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = data != null ? data.hashCode() : 0;
        result = 31 * result + (type != null ? type.hashCode() : 0);
        result = 31 * result + (dataTime != null ? dataTime.hashCode() : 0);
        result = 31 * result + (remarks != null ? remarks.hashCode() : 0);
        result = 31 * result + vitalSignId;
        result = 31 * result + (status != null ? status.hashCode() : 0);
        result = 31 * result + (medicationTaken != null ? medicationTaken.hashCode() : 0);
        result = 31 * result + (foodStatus != null ? foodStatus.hashCode() : 0);
        return result;
    }

    @ManyToOne
    @JoinColumn(name = "patientId", referencedColumnName = "patientId", nullable = false)
    public Patient getPatientByPatientId() {
        return patientByPatientId;
    }

    public void setPatientByPatientId(Patient patientByPatientId) {
        this.patientByPatientId = patientByPatientId;
    }
}
