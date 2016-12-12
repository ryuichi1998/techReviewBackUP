package Entity;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import java.sql.Timestamp;
import java.util.Arrays;

/**
 * Created by liyun on 11/12/16.
 */
@Entity
public class Patient extends Person{
    private String patientId;
    private String name;
    private String nric;
    private String address;
    private String gender;
    private Timestamp dateOfBirth;
    private Double phoneNumber;
    private String email;
    private String race;
    private String citizenship;
    private String language;
    private Double weight;
    private Double height;
    private String bloodType;
    private Timestamp registrationDate;
    private String nokName;
    private Double nokPhoneNumber;
    private String nokRelation;
    private String nokEmail;
    private byte[] profileImage;

    @Id
    @Column(name = "patientId", nullable = false, length = 10)
    public String getPatientId() {
        return patientId;
    }

    public void setPatientId(String patientId) {
        this.patientId = patientId;
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
    public Double getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(Double phoneNumber) {
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
    @Column(name = "race", nullable = true, length = 45)
    public String getRace() {
        return race;
    }

    public void setRace(String race) {
        this.race = race;
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
    @Column(name = "weight", nullable = true, precision = 0)
    public Double getWeight() {
        return weight;
    }

    public void setWeight(Double weight) {
        this.weight = weight;
    }

    @Basic
    @Column(name = "height", nullable = true, precision = 0)
    public Double getHeight() {
        return height;
    }

    public void setHeight(Double height) {
        this.height = height;
    }

    @Basic
    @Column(name = "bloodType", nullable = true, length = 45)
    public String getBloodType() {
        return bloodType;
    }

    public void setBloodType(String bloodType) {
        this.bloodType = bloodType;
    }

    @Basic
    @Column(name = "registrationDate", nullable = true)
    public Timestamp getRegistrationDate() {
        return registrationDate;
    }

    public void setRegistrationDate(Timestamp registrationDate) {
        this.registrationDate = registrationDate;
    }

    @Basic
    @Column(name = "nokName", nullable = true, length = 45)
    public String getNokName() {
        return nokName;
    }

    public void setNokName(String nokName) {
        this.nokName = nokName;
    }

    @Basic
    @Column(name = "nokPhoneNumber", nullable = true, precision = 0)
    public Double getNokPhoneNumber() {
        return nokPhoneNumber;
    }

    public void setNokPhoneNumber(Double nokPhoneNumber) {
        this.nokPhoneNumber = nokPhoneNumber;
    }

    @Basic
    @Column(name = "nokRelation", nullable = true, length = 45)
    public String getNokRelation() {
        return nokRelation;
    }

    public void setNokRelation(String nokRelation) {
        this.nokRelation = nokRelation;
    }

    @Basic
    @Column(name = "nokEmail", nullable = true, length = 45)
    public String getNokEmail() {
        return nokEmail;
    }

    public void setNokEmail(String nokEmail) {
        this.nokEmail = nokEmail;
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

        Patient patient = (Patient) o;

        if (patientId != null ? !patientId.equals(patient.patientId) : patient.patientId != null) return false;
        if (name != null ? !name.equals(patient.name) : patient.name != null) return false;
        if (nric != null ? !nric.equals(patient.nric) : patient.nric != null) return false;
        if (address != null ? !address.equals(patient.address) : patient.address != null) return false;
        if (gender != null ? !gender.equals(patient.gender) : patient.gender != null) return false;
        if (dateOfBirth != null ? !dateOfBirth.equals(patient.dateOfBirth) : patient.dateOfBirth != null) return false;
        if (phoneNumber != null ? !phoneNumber.equals(patient.phoneNumber) : patient.phoneNumber != null) return false;
        if (email != null ? !email.equals(patient.email) : patient.email != null) return false;
        if (race != null ? !race.equals(patient.race) : patient.race != null) return false;
        if (citizenship != null ? !citizenship.equals(patient.citizenship) : patient.citizenship != null) return false;
        if (language != null ? !language.equals(patient.language) : patient.language != null) return false;
        if (weight != null ? !weight.equals(patient.weight) : patient.weight != null) return false;
        if (height != null ? !height.equals(patient.height) : patient.height != null) return false;
        if (bloodType != null ? !bloodType.equals(patient.bloodType) : patient.bloodType != null) return false;
        if (registrationDate != null ? !registrationDate.equals(patient.registrationDate) : patient.registrationDate != null)
            return false;
        if (nokName != null ? !nokName.equals(patient.nokName) : patient.nokName != null) return false;
        if (nokPhoneNumber != null ? !nokPhoneNumber.equals(patient.nokPhoneNumber) : patient.nokPhoneNumber != null)
            return false;
        if (nokRelation != null ? !nokRelation.equals(patient.nokRelation) : patient.nokRelation != null) return false;
        if (nokEmail != null ? !nokEmail.equals(patient.nokEmail) : patient.nokEmail != null) return false;
        if (!Arrays.equals(profileImage, patient.profileImage)) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = patientId != null ? patientId.hashCode() : 0;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (nric != null ? nric.hashCode() : 0);
        result = 31 * result + (address != null ? address.hashCode() : 0);
        result = 31 * result + (gender != null ? gender.hashCode() : 0);
        result = 31 * result + (dateOfBirth != null ? dateOfBirth.hashCode() : 0);
        result = 31 * result + (phoneNumber != null ? phoneNumber.hashCode() : 0);
        result = 31 * result + (email != null ? email.hashCode() : 0);
        result = 31 * result + (race != null ? race.hashCode() : 0);
        result = 31 * result + (citizenship != null ? citizenship.hashCode() : 0);
        result = 31 * result + (language != null ? language.hashCode() : 0);
        result = 31 * result + (weight != null ? weight.hashCode() : 0);
        result = 31 * result + (height != null ? height.hashCode() : 0);
        result = 31 * result + (bloodType != null ? bloodType.hashCode() : 0);
        result = 31 * result + (registrationDate != null ? registrationDate.hashCode() : 0);
        result = 31 * result + (nokName != null ? nokName.hashCode() : 0);
        result = 31 * result + (nokPhoneNumber != null ? nokPhoneNumber.hashCode() : 0);
        result = 31 * result + (nokRelation != null ? nokRelation.hashCode() : 0);
        result = 31 * result + (nokEmail != null ? nokEmail.hashCode() : 0);
        result = 31 * result + Arrays.hashCode(profileImage);
        return result;
    }
}
