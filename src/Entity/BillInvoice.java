package Entity;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import java.sql.Timestamp;

/**
 * Created by liyun on 10/12/16.
 */
@Entity
public class BillInvoice {
    private int invoiceId;
    private Integer patientId;
    private Timestamp billDate;
    private String payType;
    private Integer bedId;
    private Integer servId;
    private Integer consultationId;
    private Integer productId;
    private Integer wardNo;
    private Double amtPayBeforeGovt;
    private Double amtPay;
    private Double gst;
    private Double subsidy;
    private Double totalAmtPayable;
    private String status;

    @Id
    @Column(name = "invoiceId", nullable = false)
    public int getInvoiceId() {
        return invoiceId;
    }

    public void setInvoiceId(int invoiceId) {
        this.invoiceId = invoiceId;
    }

    @Basic
    @Column(name = "patientId", nullable = true)
    public Integer getPatientId() {
        return patientId;
    }

    public void setPatientId(Integer patientId) {
        this.patientId = patientId;
    }

    @Basic
    @Column(name = "billDate", nullable = true)
    public Timestamp getBillDate() {
        return billDate;
    }

    public void setBillDate(Timestamp billDate) {
        this.billDate = billDate;
    }

    @Basic
    @Column(name = "payType", nullable = true, length = 45)
    public String getPayType() {
        return payType;
    }

    public void setPayType(String payType) {
        this.payType = payType;
    }

    @Basic
    @Column(name = "bedId", nullable = true)
    public Integer getBedId() {
        return bedId;
    }

    public void setBedId(Integer bedId) {
        this.bedId = bedId;
    }

    @Basic
    @Column(name = "servId", nullable = true)
    public Integer getServId() {
        return servId;
    }

    public void setServId(Integer servId) {
        this.servId = servId;
    }

    @Basic
    @Column(name = "consultationId", nullable = true)
    public Integer getConsultationId() {
        return consultationId;
    }

    public void setConsultationId(Integer consultationId) {
        this.consultationId = consultationId;
    }

    @Basic
    @Column(name = "productId", nullable = true)
    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
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
    @Column(name = "amtPayBeforeGovt", nullable = true, precision = 0)
    public Double getAmtPayBeforeGovt() {
        return amtPayBeforeGovt;
    }

    public void setAmtPayBeforeGovt(Double amtPayBeforeGovt) {
        this.amtPayBeforeGovt = amtPayBeforeGovt;
    }

    @Basic
    @Column(name = "amtPay", nullable = true, precision = 0)
    public Double getAmtPay() {
        return amtPay;
    }

    public void setAmtPay(Double amtPay) {
        this.amtPay = amtPay;
    }

    @Basic
    @Column(name = "gst", nullable = true, precision = 0)
    public Double getGst() {
        return gst;
    }

    public void setGst(Double gst) {
        this.gst = gst;
    }

    @Basic
    @Column(name = "subsidy", nullable = true, precision = 0)
    public Double getSubsidy() {
        return subsidy;
    }

    public void setSubsidy(Double subsidy) {
        this.subsidy = subsidy;
    }

    @Basic
    @Column(name = "totalAmtPayable", nullable = true, precision = 0)
    public Double getTotalAmtPayable() {
        return totalAmtPayable;
    }

    public void setTotalAmtPayable(Double totalAmtPayable) {
        this.totalAmtPayable = totalAmtPayable;
    }

    @Basic
    @Column(name = "status", nullable = true, length = 45)
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        BillInvoice that = (BillInvoice) o;

        if (invoiceId != that.invoiceId) return false;
        if (patientId != null ? !patientId.equals(that.patientId) : that.patientId != null) return false;
        if (billDate != null ? !billDate.equals(that.billDate) : that.billDate != null) return false;
        if (payType != null ? !payType.equals(that.payType) : that.payType != null) return false;
        if (bedId != null ? !bedId.equals(that.bedId) : that.bedId != null) return false;
        if (servId != null ? !servId.equals(that.servId) : that.servId != null) return false;
        if (consultationId != null ? !consultationId.equals(that.consultationId) : that.consultationId != null)
            return false;
        if (productId != null ? !productId.equals(that.productId) : that.productId != null) return false;
        if (wardNo != null ? !wardNo.equals(that.wardNo) : that.wardNo != null) return false;
        if (amtPayBeforeGovt != null ? !amtPayBeforeGovt.equals(that.amtPayBeforeGovt) : that.amtPayBeforeGovt != null)
            return false;
        if (amtPay != null ? !amtPay.equals(that.amtPay) : that.amtPay != null) return false;
        if (gst != null ? !gst.equals(that.gst) : that.gst != null) return false;
        if (subsidy != null ? !subsidy.equals(that.subsidy) : that.subsidy != null) return false;
        if (totalAmtPayable != null ? !totalAmtPayable.equals(that.totalAmtPayable) : that.totalAmtPayable != null)
            return false;
        if (status != null ? !status.equals(that.status) : that.status != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = invoiceId;
        result = 31 * result + (patientId != null ? patientId.hashCode() : 0);
        result = 31 * result + (billDate != null ? billDate.hashCode() : 0);
        result = 31 * result + (payType != null ? payType.hashCode() : 0);
        result = 31 * result + (bedId != null ? bedId.hashCode() : 0);
        result = 31 * result + (servId != null ? servId.hashCode() : 0);
        result = 31 * result + (consultationId != null ? consultationId.hashCode() : 0);
        result = 31 * result + (productId != null ? productId.hashCode() : 0);
        result = 31 * result + (wardNo != null ? wardNo.hashCode() : 0);
        result = 31 * result + (amtPayBeforeGovt != null ? amtPayBeforeGovt.hashCode() : 0);
        result = 31 * result + (amtPay != null ? amtPay.hashCode() : 0);
        result = 31 * result + (gst != null ? gst.hashCode() : 0);
        result = 31 * result + (subsidy != null ? subsidy.hashCode() : 0);
        result = 31 * result + (totalAmtPayable != null ? totalAmtPayable.hashCode() : 0);
        result = 31 * result + (status != null ? status.hashCode() : 0);
        return result;
    }
}
