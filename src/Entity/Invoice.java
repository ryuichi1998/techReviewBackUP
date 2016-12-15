package Entity;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import java.sql.Date;

/**
 * Created by Ryuichi on 14/12/2016.
 */
@Entity
public class Invoice {
    private int invoiceId;
    private String patientId;
    private Date billingDate;
    private String paymentMethod;
    private Double totalPayable;
    private Double subsidy;
    private Double tax;
    private Double subtotal;
    private String status;

    public Invoice(String patientId, Date billingDate, String paymentMethod, Double totalPayable, Double subsidy, Double tax, Double subtotal, String status) {
        this.patientId = patientId;
        this.billingDate = billingDate;
        this.paymentMethod = paymentMethod;
        this.totalPayable = totalPayable;
        this.subsidy = subsidy;
        this.tax = tax;
        this.subtotal = subtotal;
        this.status = status;
    }

    public Invoice() {
    }

    @Id
    @Column(name = "invoiceId", nullable = false)
    public int getInvoiceId() {
        return invoiceId;
    }

    public void setInvoiceId(int invoiceId) {
        this.invoiceId = invoiceId;
    }

    @Basic
    @Column(name = "patientId", nullable = true, length = 10)
    public String getPatientId() {
        return patientId;
    }

    public void setPatientId(String patientId) {
        this.patientId = patientId;
    }

    @Basic
    @Column(name = "billingDate", nullable = true)
    public Date getBillingDate() {
        return billingDate;
    }

    public void setBillingDate(Date billingDate) {
        this.billingDate = billingDate;
    }

    @Basic
    @Column(name = "paymentMethod", nullable = true, length = 45)
    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    @Basic
    @Column(name = "totalPayable", nullable = true, precision = 0)
    public Double getTotalPayable() {
        return totalPayable;
    }

    public void setTotalPayable(Double totalPayable) {
        this.totalPayable = totalPayable;
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
    @Column(name = "tax", nullable = true, precision = 0)
    public Double getTax() {
        return tax;
    }

    public void setTax(Double tax) {
        this.tax = tax;
    }

    @Basic
    @Column(name = "subtotal", nullable = true, precision = 0)
    public Double getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(Double subtotal) {
        this.subtotal = subtotal;
    }

    @Basic
    @Column(name = "status", nullable = true, length = 5)
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

        Invoice invoice = (Invoice) o;

        if (invoiceId != invoice.invoiceId) return false;
        if (patientId != null ? !patientId.equals(invoice.patientId) : invoice.patientId != null) return false;
        if (billingDate != null ? !billingDate.equals(invoice.billingDate) : invoice.billingDate != null) return false;
        if (paymentMethod != null ? !paymentMethod.equals(invoice.paymentMethod) : invoice.paymentMethod != null)
            return false;
        if (totalPayable != null ? !totalPayable.equals(invoice.totalPayable) : invoice.totalPayable != null)
            return false;
        if (subsidy != null ? !subsidy.equals(invoice.subsidy) : invoice.subsidy != null) return false;
        if (tax != null ? !tax.equals(invoice.tax) : invoice.tax != null) return false;
        if (subtotal != null ? !subtotal.equals(invoice.subtotal) : invoice.subtotal != null) return false;
        if (status != null ? !status.equals(invoice.status) : invoice.status != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = invoiceId;
        result = 31 * result + (patientId != null ? patientId.hashCode() : 0);
        result = 31 * result + (billingDate != null ? billingDate.hashCode() : 0);
        result = 31 * result + (paymentMethod != null ? paymentMethod.hashCode() : 0);
        result = 31 * result + (totalPayable != null ? totalPayable.hashCode() : 0);
        result = 31 * result + (subsidy != null ? subsidy.hashCode() : 0);
        result = 31 * result + (tax != null ? tax.hashCode() : 0);
        result = 31 * result + (subtotal != null ? subtotal.hashCode() : 0);
        result = 31 * result + (status != null ? status.hashCode() : 0);
        return result;
    }
}
