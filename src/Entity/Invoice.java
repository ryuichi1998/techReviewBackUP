package Entity;

import javax.persistence.*;
import java.math.BigDecimal;
import java.sql.Date;

/**
 * Created by Ryuichi on 2/2/2017.
 */
@Entity
public class Invoice {
    private int invoiceId;
    private Date billingDate;
    private Date dueDate;
    private String paymentMethod;
    private BigDecimal totalPay;
    private BigDecimal subTotal;
    private BigDecimal tax;
    private BigDecimal subsidy;
    private String status;
    private Patient patientByPatientId;

    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    @Column(name = "invoiceId", nullable = false)
    public int getInvoiceId() {
        return invoiceId;
    }

    public void setInvoiceId(int invoiceId) {
        this.invoiceId = invoiceId;
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
    @Column(name = "dueDate", nullable = true)
    public Date getDueDate() {
        return dueDate;
    }

    public void setDueDate(Date dueDate) {
        this.dueDate = dueDate;
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
    @Column(name = "totalPay", nullable = true, precision = 2)
    public BigDecimal getTotalPay() {
        return totalPay;
    }

    public void setTotalPay(BigDecimal totalPay) {
        this.totalPay = totalPay;
    }

    @Basic
    @Column(name = "subTotal", nullable = true, precision = 2)
    public BigDecimal getSubTotal() {
        return subTotal;
    }

    public void setSubTotal(BigDecimal subTotal) {
        this.subTotal = subTotal;
    }

    @Basic
    @Column(name = "tax", nullable = true, precision = 2)
    public BigDecimal getTax() {
        return tax;
    }

    public void setTax(BigDecimal tax) {
        this.tax = tax;
    }

    @Basic
    @Column(name = "subsidy", nullable = true, precision = 2)
    public BigDecimal getSubsidy() {
        return subsidy;
    }

    public void setSubsidy(BigDecimal subsidy) {
        this.subsidy = subsidy;
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

        Invoice invoice = (Invoice) o;

        if (invoiceId != invoice.invoiceId) return false;
        if (billingDate != null ? !billingDate.equals(invoice.billingDate) : invoice.billingDate != null) return false;
        if (dueDate != null ? !dueDate.equals(invoice.dueDate) : invoice.dueDate != null) return false;
        if (paymentMethod != null ? !paymentMethod.equals(invoice.paymentMethod) : invoice.paymentMethod != null)
            return false;
        if (totalPay != null ? !totalPay.equals(invoice.totalPay) : invoice.totalPay != null) return false;
        if (subTotal != null ? !subTotal.equals(invoice.subTotal) : invoice.subTotal != null) return false;
        if (tax != null ? !tax.equals(invoice.tax) : invoice.tax != null) return false;
        if (subsidy != null ? !subsidy.equals(invoice.subsidy) : invoice.subsidy != null) return false;
        if (status != null ? !status.equals(invoice.status) : invoice.status != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = invoiceId;
        result = 31 * result + (billingDate != null ? billingDate.hashCode() : 0);
        result = 31 * result + (dueDate != null ? dueDate.hashCode() : 0);
        result = 31 * result + (paymentMethod != null ? paymentMethod.hashCode() : 0);
        result = 31 * result + (totalPay != null ? totalPay.hashCode() : 0);
        result = 31 * result + (subTotal != null ? subTotal.hashCode() : 0);
        result = 31 * result + (tax != null ? tax.hashCode() : 0);
        result = 31 * result + (subsidy != null ? subsidy.hashCode() : 0);
        result = 31 * result + (status != null ? status.hashCode() : 0);
        return result;
    }

    @ManyToOne
    @JoinColumn(name = "patientId", referencedColumnName = "patientId")
    public Patient getPatientByPatientId() {
        return patientByPatientId;
    }

    public void setPatientByPatientId(Patient patientByPatientId) {
        this.patientByPatientId = patientByPatientId;
    }


}
