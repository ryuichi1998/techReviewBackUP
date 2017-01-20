package DAO;

import Entity.Patient;
import Entity.VitalSigns;
import Model.EMF;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Objects;

/**
 * Created by liyun on 13/12/16.
 */
public class VitalSignsDAO {

    private EntityManager em;

    public VitalSignsDAO() {
        em = EMF.getInstance().createEntityManager();
    }

    public List<VitalSigns> getVitalSignListByPatientId(String patientId){
        List<VitalSigns> vitalSignsList = new ArrayList<VitalSigns>();

        try {
            Query query = em.createQuery("SELECT vitalSign FROM VitalSigns vitalSign WHERE vitalSign.patientByPatientId.patientId = '" + patientId + "'");
            vitalSignsList = (List<VitalSigns>) query.getResultList();
        }catch (Exception e){
            e.printStackTrace();
        }

        for(VitalSigns v:vitalSignsList){
            System.out.println(v.getData() + " " + v.getPatientByPatientId().getPatientId());
        }

        return vitalSignsList;
    }

    /**
     * Create Vital Signs
     * @param data
     * @param type
     * @param dateTime
     * @param remarks
     * @param status
     * @param medicationTaken
     * @param foodStatus
     * @return
     */
    public boolean createVitalSign(String data, String type, Date dateTime, String remarks, String status, String medicationTaken, String foodStatus, String patientId){
        boolean success = false;

        VitalSigns vitalSigns = new VitalSigns();

        PatientDAO patientDAO = new PatientDAO();

        vitalSigns.setData(data);
        vitalSigns.setType(type);
        vitalSigns.setDataTime(new Timestamp(dateTime.getTime()));
        vitalSigns.setRemarks(remarks);
        vitalSigns.setStatus(status);
        vitalSigns.setMedicationTaken(medicationTaken);
        vitalSigns.setFoodStatus(foodStatus);
        vitalSigns.setPatientByPatientId(patientDAO.getPatientByPatientId(patientId));

        em.getTransaction().begin();

        em.persist(vitalSigns);

        em.getTransaction().commit();

        success = isPersistenceSuccessful(vitalSigns);

        em.close();
        return success;
    }

    private boolean isPersistenceSuccessful(Object obj){
        boolean success = false;

        if (em.contains(obj))
            success = true;

        return success;
    }
}
