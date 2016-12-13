package Entity;

import javax.persistence.*;

/**
 * Created by liyun on 13/12/16.
 */
@Entity
public class FamilyMedicalBackground {
    private String relative;
    private String condition;
    private int familyMedicalBackgroundId;
    private Patient patientByPatientId;

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

    @Id
    @Column(name = "familyMedicalBackgroundId", nullable = false)
    public int getFamilyMedicalBackgroundId() {
        return familyMedicalBackgroundId;
    }

    public void setFamilyMedicalBackgroundId(int familyMedicalBackgroundId) {
        this.familyMedicalBackgroundId = familyMedicalBackgroundId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        FamilyMedicalBackground that = (FamilyMedicalBackground) o;

        if (familyMedicalBackgroundId != that.familyMedicalBackgroundId) return false;
        if (relative != null ? !relative.equals(that.relative) : that.relative != null) return false;
        if (condition != null ? !condition.equals(that.condition) : that.condition != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = relative != null ? relative.hashCode() : 0;
        result = 31 * result + (condition != null ? condition.hashCode() : 0);
        result = 31 * result + familyMedicalBackgroundId;
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
