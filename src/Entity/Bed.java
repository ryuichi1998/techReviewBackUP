package Entity;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

/**
 * Created by liyun on 10/12/16.
 */
@Entity
public class Bed {
    private int bedId;
    private String availability;
    private Integer wardNo;

    @Id
    @Column(name = "bedId", nullable = false)
    public int getBedId() {
        return bedId;
    }

    public void setBedId(int bedId) {
        this.bedId = bedId;
    }

    @Basic
    @Column(name = "availability", nullable = true, length = 45)
    public String getAvailability() {
        return availability;
    }

    public void setAvailability(String availability) {
        this.availability = availability;
    }

    @Basic
    @Column(name = "wardNo", nullable = true)
    public Integer getWardNo() {
        return wardNo;
    }

    public void setWardNo(Integer wardNo) {
        this.wardNo = wardNo;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Bed bed = (Bed) o;

        if (bedId != bed.bedId) return false;
        if (availability != null ? !availability.equals(bed.availability) : bed.availability != null) return false;
        if (wardNo != null ? !wardNo.equals(bed.wardNo) : bed.wardNo != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = bedId;
        result = 31 * result + (availability != null ? availability.hashCode() : 0);
        result = 31 * result + (wardNo != null ? wardNo.hashCode() : 0);
        return result;
    }
}
