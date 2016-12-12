package Entity;

import javax.persistence.*;
import java.sql.Timestamp;

/**
 * Created by liyun on 13/12/16.
 */
@Entity
public class Device {
    private String deviceId;
    private Timestamp lastSyncDateTime;
    private Patient patientByPatientId;

    @Id
    @Column(name = "deviceId", nullable = false, length = 45)
    public String getDeviceId() {
        return deviceId;
    }

    public void setDeviceId(String deviceId) {
        this.deviceId = deviceId;
    }

    @Basic
    @Column(name = "lastSyncDateTime", nullable = true)
    public Timestamp getLastSyncDateTime() {
        return lastSyncDateTime;
    }

    public void setLastSyncDateTime(Timestamp lastSyncDateTime) {
        this.lastSyncDateTime = lastSyncDateTime;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Device device = (Device) o;

        if (deviceId != null ? !deviceId.equals(device.deviceId) : device.deviceId != null) return false;
        if (lastSyncDateTime != null ? !lastSyncDateTime.equals(device.lastSyncDateTime) : device.lastSyncDateTime != null)
            return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = deviceId != null ? deviceId.hashCode() : 0;
        result = 31 * result + (lastSyncDateTime != null ? lastSyncDateTime.hashCode() : 0);
        return result;
    }

    @ManyToOne
    @JoinColumn(name = "patientId", referencedColumnName = "patientId", nullable = false)
    public Patient getPatientByPatientId() {
        return patientByPatientId;
    }

    public void setPatientByPatientId(Patient patientByPatientId) {
        this.patientByPatientId = patientByPatientId;
    }
}
