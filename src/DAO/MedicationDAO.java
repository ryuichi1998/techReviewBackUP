package DAO;

import Entity.Medication;
import Model.EMF;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by liyun on 14/12/16.
 */
public class MedicationDAO {

    private EntityManager em;

    public MedicationDAO() {
        em = EMF.getInstance().createEntityManager();
    }

    public List<Medication> getMedicationByConsultationId(String consultationId) {
        List<Medication> medicationList = new ArrayList<Medication>();

        try {
            Query query = em.createQuery("SELECT medication FROM Medication medication WHERE medication.consultationrecordByConsultationid.consultationId = '" + consultationId + "'");
            medicationList = (List<Medication>) query.getResultList();
        } catch (Exception e) {

        }

        return medicationList;
    }

}
