package Entity;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import java.math.BigDecimal;

/**
 * Created by Ryuichi on 1/2/2017.
 */
@Entity
public class Service {
    private int serviceId;
    private BigDecimal price;
    private String serDesc;

    @Id
    @Column(name = "serviceId", nullable = false)
    public int getServiceId() {
        return serviceId;
    }

    public void setServiceId(int serviceId) {
        this.serviceId = serviceId;
    }

    @Basic
    @Column(name = "price", nullable = true, precision = 2)
    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    @Basic
    @Column(name = "serDesc", nullable = true, length = 45)
    public String getSerDesc() {
        return serDesc;
    }

    public void setSerDesc(String serDesc) {
        this.serDesc = serDesc;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Service service = (Service) o;

        if (serviceId != service.serviceId) return false;
        if (price != null ? !price.equals(service.price) : service.price != null) return false;
        if (serDesc != null ? !serDesc.equals(service.serDesc) : service.serDesc != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = serviceId;
        result = 31 * result + (price != null ? price.hashCode() : 0);
        result = 31 * result + (serDesc != null ? serDesc.hashCode() : 0);
        return result;
    }
}
