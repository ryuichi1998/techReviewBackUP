package Entity;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import java.math.BigDecimal;
import java.sql.Date;

/**
 * Created by Ryuichi on 2/2/2017.
 */
@Entity
public class Servdetails {
    private int servDetailsId;
    private Integer qnty;
    private Date billingDate;
    private BigDecimal subtotal;

    @Id
    @Column(name = "servDetailsId", nullable = false)
    public int getServDetailsId() {
        return servDetailsId;
    }

    public void setServDetailsId(int servDetailsId) {
        this.servDetailsId = servDetailsId;
    }

    @Basic
    @Column(name = "qnty", nullable = true)
    public Integer getQnty() {
        return qnty;
    }

    public void setQnty(Integer qnty) {
        this.qnty = qnty;
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
    @Column(name = "subtotal", nullable = true, precision = 2)
    public BigDecimal getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(BigDecimal subtotal) {
        this.subtotal = subtotal;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Servdetails that = (Servdetails) o;

        if (servDetailsId != that.servDetailsId) return false;
        if (qnty != null ? !qnty.equals(that.qnty) : that.qnty != null) return false;
        if (billingDate != null ? !billingDate.equals(that.billingDate) : that.billingDate != null) return false;
        if (subtotal != null ? !subtotal.equals(that.subtotal) : that.subtotal != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = servDetailsId;
        result = 31 * result + (qnty != null ? qnty.hashCode() : 0);
        result = 31 * result + (billingDate != null ? billingDate.hashCode() : 0);
        result = 31 * result + (subtotal != null ? subtotal.hashCode() : 0);
        return result;
    }
}
