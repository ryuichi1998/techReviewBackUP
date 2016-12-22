package Entity;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Arrays;
import java.util.Collection;

/**
 * Created by liyun on 13/12/16.
 */
@Entity
public class Staff extends Person{
    private String staffId;
    private String name;
    private String nric;
    private String address;
    private String gender;
    private Timestamp dateOfBirth;
    private String phoneNumber;
    private String email;
    private String citizenship;
    private String language;
    private String type;
    private byte[] profileImage;
    private Collection<ConsultationRecord> consultationrecordsByStaffId;
    private Collection<Appointment> appointmentByStaffId;

    @Id
    @Column(name = "staffId", nullable = false, length = 10)
    public String getStaffId() {
        return staffId;
    }

    public void setStaffId(String staffId) {
        this.staffId = staffId;
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
    @Column(name = "nric", nullable = true, length = 45)
    public String getNric() {
        return nric;
    }

    public void setNric(String nric) {
        this.nric = nric;
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
    @Column(name = "gender", nullable = true, length = 45)
    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    @Basic
    @Column(name = "dateOfBirth", nullable = true)
    public Timestamp getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(Timestamp dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    @Basic
    @Column(name = "phoneNumber", nullable = true, precision = 0)
    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    @Basic
    @Column(name = "email", nullable = true, length = 45)
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Basic
    @Column(name = "citizenship", nullable = true, length = 45)
    public String getCitizenship() {
        return citizenship;
    }

    public void setCitizenship(String citizenship) {
        this.citizenship = citizenship;
    }

    @Basic
    @Column(name = "language", nullable = true, length = 45)
    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    @Basic
    @Column(name = "type", nullable = true, length = 30)
    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    @Basic
    @Column(name = "profileImage", nullable = true)
    public byte[] getProfileImage() {
        return profileImage;
    }

    public void setProfileImage(byte[] profileImage) {
        this.profileImage = profileImage;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Staff staff = (Staff) o;

        if (staffId != null ? !staffId.equals(staff.staffId) : staff.staffId != null) return false;
        if (name != null ? !name.equals(staff.name) : staff.name != null) return false;
        if (nric != null ? !nric.equals(staff.nric) : staff.nric != null) return false;
        if (address != null ? !address.equals(staff.address) : staff.address != null) return false;
        if (gender != null ? !gender.equals(staff.gender) : staff.gender != null) return false;
        if (dateOfBirth != null ? !dateOfBirth.equals(staff.dateOfBirth) : staff.dateOfBirth != null) return false;
        if (phoneNumber != null ? !phoneNumber.equals(staff.phoneNumber) : staff.phoneNumber != null) return false;
        if (email != null ? !email.equals(staff.email) : staff.email != null) return false;
        if (citizenship != null ? !citizenship.equals(staff.citizenship) : staff.citizenship != null) return false;
        if (language != null ? !language.equals(staff.language) : staff.language != null) return false;
        if (type != null ? !type.equals(staff.type) : staff.type != null) return false;
        if (!Arrays.equals(profileImage, staff.profileImage)) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = staffId != null ? staffId.hashCode() : 0;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (nric != null ? nric.hashCode() : 0);
        result = 31 * result + (address != null ? address.hashCode() : 0);
        result = 31 * result + (gender != null ? gender.hashCode() : 0);
        result = 31 * result + (dateOfBirth != null ? dateOfBirth.hashCode() : 0);
        result = 31 * result + (phoneNumber != null ? phoneNumber.hashCode() : 0);
        result = 31 * result + (email != null ? email.hashCode() : 0);
        result = 31 * result + (citizenship != null ? citizenship.hashCode() : 0);
        result = 31 * result + (language != null ? language.hashCode() : 0);
        result = 31 * result + (type != null ? type.hashCode() : 0);
        result = 31 * result + Arrays.hashCode(profileImage);
        return result;
    }

    @OneToMany(mappedBy = "staffByDoctorInCharge")
    public Collection<ConsultationRecord> getConsultationrecordsByStaffId() {
        return consultationrecordsByStaffId;
    }

    public void setConsultationrecordsByStaffId(Collection<ConsultationRecord> consultationrecordsByStaffId) {
        this.consultationrecordsByStaffId = consultationrecordsByStaffId;
    }

    @OneToMany(mappedBy = "doctorByStaffId")
    public Collection<Appointment> getAppointmentByStaffId() {
        return appointmentByStaffId;
    }

    public void setAppointmentByStaffId(Collection<Appointment> appointmentByStaffId) {
        this.appointmentByStaffId = appointmentByStaffId;
    }
}
