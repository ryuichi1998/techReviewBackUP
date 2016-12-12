package Entity;

import javax.persistence.*;

/**
 * Created by qingyutan on 12/12/16.
 */
@Entity
@Table(name = "faqrecord", schema = "mi2", catalog = "")
public class FaqrecordEntity {
    private int faqId;
    private String illness;
    private String diagnosis;
    private String causes;
    private Integer prevention;
    private String symptops;
    private String treatment;
    private String others;

    @Id
    @Column(name = "faqId")
    public int getFaqId() {
        return faqId;
    }

    public void setFaqId(int faqId) {
        this.faqId = faqId;
    }

    @Basic
    @Column(name = "illness")
    public String getIllness() {
        return illness;
    }

    public void setIllness(String illness) {
        this.illness = illness;
    }

    @Basic
    @Column(name = "diagnosis")
    public String getDiagnosis() {
        return diagnosis;
    }

    public void setDiagnosis(String diagnosis) {
        this.diagnosis = diagnosis;
    }

    @Basic
    @Column(name = "causes")
    public String getCauses() {
        return causes;
    }

    public void setCauses(String causes) {
        this.causes = causes;
    }

    @Basic
    @Column(name = "prevention")
    public Integer getPrevention() {
        return prevention;
    }

    public void setPrevention(Integer prevention) {
        this.prevention = prevention;
    }

    @Basic
    @Column(name = "symptops")
    public String getSymptops() {
        return symptops;
    }

    public void setSymptops(String symptops) {
        this.symptops = symptops;
    }

    @Basic
    @Column(name = "treatment")
    public String getTreatment() {
        return treatment;
    }

    public void setTreatment(String treatment) {
        this.treatment = treatment;
    }

    @Basic
    @Column(name = "others")
    public String getOthers() {
        return others;
    }

    public void setOthers(String others) {
        this.others = others;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        FaqrecordEntity that = (FaqrecordEntity) o;

        if (faqId != that.faqId) return false;
        if (illness != null ? !illness.equals(that.illness) : that.illness != null) return false;
        if (diagnosis != null ? !diagnosis.equals(that.diagnosis) : that.diagnosis != null) return false;
        if (causes != null ? !causes.equals(that.causes) : that.causes != null) return false;
        if (prevention != null ? !prevention.equals(that.prevention) : that.prevention != null) return false;
        if (symptops != null ? !symptops.equals(that.symptops) : that.symptops != null) return false;
        if (treatment != null ? !treatment.equals(that.treatment) : that.treatment != null) return false;
        if (others != null ? !others.equals(that.others) : that.others != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = faqId;
        result = 31 * result + (illness != null ? illness.hashCode() : 0);
        result = 31 * result + (diagnosis != null ? diagnosis.hashCode() : 0);
        result = 31 * result + (causes != null ? causes.hashCode() : 0);
        result = 31 * result + (prevention != null ? prevention.hashCode() : 0);
        result = 31 * result + (symptops != null ? symptops.hashCode() : 0);
        result = 31 * result + (treatment != null ? treatment.hashCode() : 0);
        result = 31 * result + (others != null ? others.hashCode() : 0);
        return result;
    }
}
