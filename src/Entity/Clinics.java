package Entity;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

/**
 * Created by liyun on 10/12/16.
 */
@Entity
public class Clinics {
    private int unitnumber;
    private String name;
    private String block;
    private String address;
    private String postalcode;

    @Id
    @Column(name = "unitnumber", nullable = false)
    public int getUnitnumber() {
        return unitnumber;
    }

    public void setUnitnumber(int unitnumber) {
        this.unitnumber = unitnumber;
    }

    @Basic
    @Column(name = "name", nullable = true, length = 45)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "block", nullable = true, length = 45)
    public String getBlock() {
        return block;
    }

    public void setBlock(String block) {
        this.block = block;
    }

    @Basic
    @Column(name = "address", nullable = true, length = 45)
    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Basic
    @Column(name = "postalcode", nullable = true, length = 45)
    public String getPostalcode() {
        return postalcode;
    }

    public void setPostalcode(String postalcode) {
        this.postalcode = postalcode;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Clinics clinics = (Clinics) o;

        if (unitnumber != clinics.unitnumber) return false;
        if (name != null ? !name.equals(clinics.name) : clinics.name != null) return false;
        if (block != null ? !block.equals(clinics.block) : clinics.block != null) return false;
        if (address != null ? !address.equals(clinics.address) : clinics.address != null) return false;
        if (postalcode != null ? !postalcode.equals(clinics.postalcode) : clinics.postalcode != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = unitnumber;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (block != null ? block.hashCode() : 0);
        result = 31 * result + (address != null ? address.hashCode() : 0);
        result = 31 * result + (postalcode != null ? postalcode.hashCode() : 0);
        return result;
    }
}
