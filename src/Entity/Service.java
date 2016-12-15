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
public class Service {
    private int serviceId;
    private String patientId;
    private String serviceDesc;
    private Date serviceDate;
    private Double serviceFee;
    private String servicePaymentStatus;
    private Integer serviceQty;
    private Integer invoiceId;

    @Id
    @Column(name = "serviceId", nullable = false)
    public int getServiceId() {
        return serviceId;
    }

    public void setServiceId(int serviceId) {
        this.serviceId = serviceId;
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
    @Column(name = "serviceDesc", nullable = true, length = 45)
    public String getServiceDesc() {
        return serviceDesc;
    }

    public void setServiceDesc(String serviceDesc) {
        this.serviceDesc = serviceDesc;
    }

    @Basic
    @Column(name = "serviceDate", nullable = true)
    public Date getServiceDate() {
        return serviceDate;
    }

    public void setServiceDate(Date serviceDate) {
        this.serviceDate = serviceDate;
    }

    @Basic
    @Column(name = "serviceFee", nullable = true, precision = 0)
    public Double getServiceFee() {
        return serviceFee;
    }

    public void setServiceFee(Double serviceFee) {
        this.serviceFee = serviceFee;
    }

    @Basic
    @Column(name = "servicePaymentStatus", nullable = true, length = 5)
    public String getServicePaymentStatus() {
        return servicePaymentStatus;
    }

    public void setServicePaymentStatus(String servicePaymentStatus) {
        this.servicePaymentStatus = servicePaymentStatus;
    }

    @Basic
    @Column(name = "serviceQty", nullable = true)
    public Integer getServiceQty() {
        return serviceQty;
    }

    public void setServiceQty(Integer serviceQty) {
        this.serviceQty = serviceQty;
    }

    @Basic
    @Column(name = "invoiceId", nullable = true)
    public Integer getInvoiceId() {
        return invoiceId;
    }

    public void setInvoiceId(Integer invoiceId) {
        this.invoiceId = invoiceId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Service service = (Service) o;

        if (serviceId != service.serviceId) return false;
        if (patientId != null ? !patientId.equals(service.patientId) : service.patientId != null) return false;
        if (serviceDesc != null ? !serviceDesc.equals(service.serviceDesc) : service.serviceDesc != null) return false;
        if (serviceDate != null ? !serviceDate.equals(service.serviceDate) : service.serviceDate != null) return false;
        if (serviceFee != null ? !serviceFee.equals(service.serviceFee) : service.serviceFee != null) return false;
        if (servicePaymentStatus != null ? !servicePaymentStatus.equals(service.servicePaymentStatus) : service.servicePaymentStatus != null)
            return false;
        if (serviceQty != null ? !serviceQty.equals(service.serviceQty) : service.serviceQty != null) return false;
        if (invoiceId != null ? !invoiceId.equals(service.invoiceId) : service.invoiceId != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = serviceId;
        result = 31 * result + (patientId != null ? patientId.hashCode() : 0);
        result = 31 * result + (serviceDesc != null ? serviceDesc.hashCode() : 0);
        result = 31 * result + (serviceDate != null ? serviceDate.hashCode() : 0);
        result = 31 * result + (serviceFee != null ? serviceFee.hashCode() : 0);
        result = 31 * result + (servicePaymentStatus != null ? servicePaymentStatus.hashCode() : 0);
        result = 31 * result + (serviceQty != null ? serviceQty.hashCode() : 0);
        result = 31 * result + (invoiceId != null ? invoiceId.hashCode() : 0);
        return result;
    }
}
