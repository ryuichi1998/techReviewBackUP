package Entity;

import javax.persistence.*;

/**
 * Created by liyun on 14/12/16.
 */
@Entity
public class FamilyMedicalBackground {
    private String relativeRelationship;
    private String conditionName;
    private int familyMedicalBackgroundId;
    private Patient patientByPatientId;

    @Basic
    @Column(name = "relativeRelationship", nullable = true, length = 45)
    public String getRelativeRelationship() {
        return relativeRelationship;
    }

    public void setRelativeRelationship(String relativeRelationship) {
        this.relativeRelationship = relativeRelationship;
    }

    @Basic
    @Column(name = "conditionName", nullable = true, length = 45)
    public String getConditionName() {
        return conditionName;
    }

    public void setConditionName(String conditionName) {
        this.conditionName = conditionName;
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
        if (relativeRelationship != null ? !relativeRelationship.equals(that.relativeRelationship) : that.relativeRelationship != null) return false;
        if (conditionName != null ? !conditionName.equals(that.conditionName) : that.conditionName != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = relativeRelationship != null ? relativeRelationship.hashCode() : 0;
        result = 31 * result + (conditionName != null ? conditionName.hashCode() : 0);
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
