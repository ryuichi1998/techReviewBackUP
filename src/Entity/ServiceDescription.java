package Entity;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

/**
 * Created by liyun on 10/12/16.
 */
@Entity
public class ServiceDescription {
    private int servId;
    private String servDesc;
    private Double servFee;
    private String servDate;

    @Id
    @Column(name = "servId", nullable = false)
    public int getServId() {
        return servId;
    }

    public void setServId(int servId) {
        this.servId = servId;
    }

    @Basic
    @Column(name = "servDesc", nullable = true, length = 45)
    public String getServDesc() {
        return servDesc;
    }

    public void setServDesc(String servDesc) {
        this.servDesc = servDesc;
    }

    @Basic
    @Column(name = "servFee", nullable = true, precision = 0)
    public Double getServFee() {
        return servFee;
    }

    public void setServFee(Double servFee) {
        this.servFee = servFee;
    }

    @Basic
    @Column(name = "servDate", nullable = true, length = 45)
    public String getServDate() {
        return servDate;
    }

    public void setServDate(String servDate) {
        this.servDate = servDate;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        ServiceDescription that = (ServiceDescription) o;

        if (servId != that.servId) return false;
        if (servDesc != null ? !servDesc.equals(that.servDesc) : that.servDesc != null) return false;
        if (servFee != null ? !servFee.equals(that.servFee) : that.servFee != null) return false;
        if (servDate != null ? !servDate.equals(that.servDate) : that.servDate != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = servId;
        result = 31 * result + (servDesc != null ? servDesc.hashCode() : 0);
        result = 31 * result + (servFee != null ? servFee.hashCode() : 0);
        result = 31 * result + (servDate != null ? servDate.hashCode() : 0);
        return result;
    }
}
