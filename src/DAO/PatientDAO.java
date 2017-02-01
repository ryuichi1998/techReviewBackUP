package DAO;

import Entity.Patient;
import Model.EMF;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import java.util.List;

/**
 * Created by liyun on 11/12/16.
 */
public class PatientDAO {

    private EntityManager em;

    public PatientDAO(){
        em = EMF.getInstance().createEntityManager();
    }

    public Patient getPatientByPatientId(String patientId){

        Patient patient = null;

        try {
            patient = em.find(Patient.class, patientId);
        }catch (Exception e){
            e.printStackTrace();
        }

        return patient;

    }

    public List<Patient> retrieveAllPatient() {
        List<Patient> patientList = null;

        try {
            Query query = em.createQuery("SELECT p from Patient p");
            patientList = query.getResultList();

        } catch(Exception e) {

        }
        return patientList;
    }

}
