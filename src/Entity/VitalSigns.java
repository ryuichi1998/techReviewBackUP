package Entity;

import javax.persistence.*;
import java.sql.Timestamp;

/**
 * Created by liyun on 13/12/16.
 */
@Entity
public class VitalSigns {
    private Double data;
    private String type;
    private Timestamp dataTime;
    private String remarks;
    private Patient patientByPatientId;

    @Basic
    @Column(name = "data", nullable = true, precision = 0)
    public Double getData() {
        return data;
    }

    public void setData(Double data) {
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

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        VitalSigns that = (VitalSigns) o;

        if (data != null ? !data.equals(that.data) : that.data != null) return false;
        if (type != null ? !type.equals(that.type) : that.type != null) return false;
        if (dataTime != null ? !dataTime.equals(that.dataTime) : that.dataTime != null) return false;
        if (remarks != null ? !remarks.equals(that.remarks) : that.remarks != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = data != null ? data.hashCode() : 0;
        result = 31 * result + (type != null ? type.hashCode() : 0);
        result = 31 * result + (dataTime != null ? dataTime.hashCode() : 0);
        result = 31 * result + (remarks != null ? remarks.hashCode() : 0);
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
