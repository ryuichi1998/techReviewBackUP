package Entity;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

/**
 * Created by liyun on 10/12/16.
 */
@Entity
public class FamilyMedicalBackground {
    private int patientId;
    private String relative;
    private String condition;

    @Id
    @Column(name = "patientId", nullable = false)
    public int getPatientId() {
        return patientId;
    }

    public void setPatientId(int patientId) {
        this.patientId = patientId;
    }

    @Basic
    @Column(name = "relative", nullable = true, length = 45)
    public String getRelative() {
        return relative;
    }

    public void setRelative(String relative) {
        this.relative = relative;
    }

    @Basic
    @Column(name = "condition", nullable = true, length = 45)
    public String getCondition() {
        return condition;
    }

    public void setCondition(String condition) {
        this.condition = condition;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        FamilyMedicalBackground that = (FamilyMedicalBackground) o;

        if (patientId != that.patientId) return false;
        if (relative != null ? !relative.equals(that.relative) : that.relative != null) return false;
        if (condition != null ? !condition.equals(that.condition) : that.condition != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = patientId;
        result = 31 * result + (relative != null ? relative.hashCode() : 0);
        result = 31 * result + (condition != null ? condition.hashCode() : 0);
        return result;
    }
}
