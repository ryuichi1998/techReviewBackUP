package Entity;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

/**
 * Created by liyun on 10/12/16.
 */
@Entity
public class Ward {
    private int wardNo;
    private String classType;
    private Integer bedTotalCapacity;
    private Integer bedAllocatedCapacity;
    private Double wardFees;
    private String gender;

    @Id
    @Column(name = "wardNo", nullable = false)
    public int getWardNo() {
        return wardNo;
    }

    public void setWardNo(int wardNo) {
        this.wardNo = wardNo;
    }

    @Basic
    @Column(name = "classType", nullable = true, length = 45)
    public String getClassType() {
        return classType;
    }

    public void setClassType(String classType) {
        this.classType = classType;
    }

    @Basic
    @Column(name = "bedTotalCapacity", nullable = true)
    public Integer getBedTotalCapacity() {
        return bedTotalCapacity;
    }

    public void setBedTotalCapacity(Integer bedTotalCapacity) {
        this.bedTotalCapacity = bedTotalCapacity;
    }

    @Basic
    @Column(name = "bedAllocatedCapacity", nullable = true)
    public Integer getBedAllocatedCapacity() {
        return bedAllocatedCapacity;
    }

    public void setBedAllocatedCapacity(Integer bedAllocatedCapacity) {
        this.bedAllocatedCapacity = bedAllocatedCapacity;
    }

    @Basic
    @Column(name = "wardFees", nullable = true, precision = 0)
    public Double getWardFees() {
        return wardFees;
    }

    public void setWardFees(Double wardFees) {
        this.wardFees = wardFees;
    }

    @Basic
    @Column(name = "Gender", nullable = true, length = 45)
    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Ward ward = (Ward) o;

        if (wardNo != ward.wardNo) return false;
        if (classType != null ? !classType.equals(ward.classType) : ward.classType != null) return false;
        if (bedTotalCapacity != null ? !bedTotalCapacity.equals(ward.bedTotalCapacity) : ward.bedTotalCapacity != null)
            return false;
        if (bedAllocatedCapacity != null ? !bedAllocatedCapacity.equals(ward.bedAllocatedCapacity) : ward.bedAllocatedCapacity != null)
            return false;
        if (wardFees != null ? !wardFees.equals(ward.wardFees) : ward.wardFees != null) return false;
        if (gender != null ? !gender.equals(ward.gender) : ward.gender != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = wardNo;
        result = 31 * result + (classType != null ? classType.hashCode() : 0);
        result = 31 * result + (bedTotalCapacity != null ? bedTotalCapacity.hashCode() : 0);
        result = 31 * result + (bedAllocatedCapacity != null ? bedAllocatedCapacity.hashCode() : 0);
        result = 31 * result + (wardFees != null ? wardFees.hashCode() : 0);
        result = 31 * result + (gender != null ? gender.hashCode() : 0);
        return result;
    }
}
