package Entity;

import javax.persistence.*;

/**
 * Created by liyun on 13/12/16.
 */
@Entity
public class Medication {
    private Integer productid;
    private String frequency;
    private Double quantity;
    private String collection;
    private String remarks;
    private int medicationId;
    private ConsultationRecord consultationrecordByConsultationid;

    @Basic
    @Column(name = "productid", nullable = true)
    public Integer getProductid() {
        return productid;
    }

    public void setProductid(Integer productid) {
        this.productid = productid;
    }

    @Basic
    @Column(name = "frequency", nullable = true, length = 45)
    public String getFrequency() {
        return frequency;
    }

    public void setFrequency(String frequency) {
        this.frequency = frequency;
    }

    @Basic
    @Column(name = "quantity", nullable = true, precision = 0)
    public Double getQuantity() {
        return quantity;
    }

    public void setQuantity(Double quantity) {
        this.quantity = quantity;
    }

    @Basic
    @Column(name = "collection", nullable = true, length = 1)
    public String getCollection() {
        return collection;
    }

    public void setCollection(String collection) {
        this.collection = collection;
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
    @Column(name = "medicationId", nullable = false)
    public int getMedicationId() {
        return medicationId;
    }

    public void setMedicationId(int medicationId) {
        this.medicationId = medicationId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Medication that = (Medication) o;

        if (medicationId != that.medicationId) return false;
        if (productid != null ? !productid.equals(that.productid) : that.productid != null) return false;
        if (frequency != null ? !frequency.equals(that.frequency) : that.frequency != null) return false;
        if (quantity != null ? !quantity.equals(that.quantity) : that.quantity != null) return false;
        if (collection != null ? !collection.equals(that.collection) : that.collection != null) return false;
        if (remarks != null ? !remarks.equals(that.remarks) : that.remarks != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = productid != null ? productid.hashCode() : 0;
        result = 31 * result + (frequency != null ? frequency.hashCode() : 0);
        result = 31 * result + (quantity != null ? quantity.hashCode() : 0);
        result = 31 * result + (collection != null ? collection.hashCode() : 0);
        result = 31 * result + (remarks != null ? remarks.hashCode() : 0);
        result = 31 * result + medicationId;
        return result;
    }

    @ManyToOne
    @JoinColumn(name = "consultationid", referencedColumnName = "consultationId", nullable = false)
    public ConsultationRecord getConsultationrecordByConsultationid() {
        return consultationrecordByConsultationid;
    }

    public void setConsultationrecordByConsultationid(ConsultationRecord consultationrecordByConsultationid) {
        this.consultationrecordByConsultationid = consultationrecordByConsultationid;
    }
}
