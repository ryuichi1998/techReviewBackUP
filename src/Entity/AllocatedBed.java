package Entity;

import javax.persistence.*;
import java.sql.Timestamp;

/**
 * Created by liyun on 10/12/16.
 */
@Entity
public class AllocatedBed {
    private int bedId;
    private Timestamp startDate;
    private Timestamp endDate;
    private Integer wardNo;
    private Integer patientId;

    @Id
    @Column(name = "bedId", nullable = false)
    public int getBedId() {
        return bedId;
    }

    public void setBedId(int bedId) {
        this.bedId = bedId;
    }

    @Basic
    @Column(name = "startDate", nullable = true)
    public Timestamp getStartDate() {
        return startDate;
    }

    public void setStartDate(Timestamp startDate) {
        this.startDate = startDate;
    }

    @Basic
    @Column(name = "endDate", nullable = true)
    public Timestamp getEndDate() {
        return endDate;
    }

    public void setEndDate(Timestamp endDate) {
        this.endDate = endDate;
    }

    @Basic
    @Column(name = "wardNo", nullable = true)
    public Integer getWardNo() {
        return wardNo;
    }

    public void setWardNo(Integer wardNo) {
        this.wardNo = wardNo;
    }

    @Basic
    @Column(name = "patientId", nullable = true)
    public Integer getPatientId() {
        return patientId;
    }

    public void setPatientId(Integer patientId) {
        this.patientId = patientId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        AllocatedBed that = (AllocatedBed) o;

        if (bedId != that.bedId) return false;
        if (startDate != null ? !startDate.equals(that.startDate) : that.startDate != null) return false;
        if (endDate != null ? !endDate.equals(that.endDate) : that.endDate != null) return false;
        if (wardNo != null ? !wardNo.equals(that.wardNo) : that.wardNo != null) return false;
        if (patientId != null ? !patientId.equals(that.patientId) : that.patientId != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = bedId;
        result = 31 * result + (startDate != null ? startDate.hashCode() : 0);
        result = 31 * result + (endDate != null ? endDate.hashCode() : 0);
        result = 31 * result + (wardNo != null ? wardNo.hashCode() : 0);
        result = 31 * result + (patientId != null ? patientId.hashCode() : 0);
        return result;
    }
}
