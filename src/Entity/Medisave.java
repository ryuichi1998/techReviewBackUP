package Entity;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

/**
 * Created by liyun on 10/12/16.
 */
@Entity
public class Medisave {
    private int patientId;
    private String nric;
    private Double balance;

    @Id
    @Column(name = "patientId", nullable = false)
    public int getPatientId() {
        return patientId;
    }

    public void setPatientId(int patientId) {
        this.patientId = patientId;
    }

    @Basic
    @Column(name = "nric", nullable = true, length = 45)
    public String getNric() {
        return nric;
    }

    public void setNric(String nric) {
        this.nric = nric;
    }

    @Basic
    @Column(name = "balance", nullable = true, precision = 0)
    public Double getBalance() {
        return balance;
    }

    public void setBalance(Double balance) {
        this.balance = balance;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Medisave medisave = (Medisave) o;

        if (patientId != medisave.patientId) return false;
        if (nric != null ? !nric.equals(medisave.nric) : medisave.nric != null) return false;
        if (balance != null ? !balance.equals(medisave.balance) : medisave.balance != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = patientId;
        result = 31 * result + (nric != null ? nric.hashCode() : 0);
        result = 31 * result + (balance != null ? balance.hashCode() : 0);
        return result;
    }
}
