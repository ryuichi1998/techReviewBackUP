package DAO;

import Entity.ConsultationRecord;
import Entity.Patient;
import Model.EMF;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by liyun on 13/12/16.
 */
public class ConsultationRecordDAO {

    private EntityManager em;

    public ConsultationRecordDAO() {
        em = EMF.getInstance().createEntityManager();
    }

    public List<Patient> getPatientListByDoctorId(String doctorId) {
        List<Patient> patientList = new ArrayList<Patient>();

        try {
            Query query = em.createQuery("SELECT DISTINCT c.patientByPatientId FROM ConsultationRecord c WHERE c.staffByDoctorInCharge.staffId = '" + doctorId + "'");
            patientList = (List<Patient>) query.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return patientList;
    }

    public List<ConsultationRecord> getConsultationRecordListByPatientId(String patientId) {
        List<ConsultationRecord> consultationRecordList = new ArrayList<ConsultationRecord>();

        try {
            Query query = em.createQuery("SELECT consultation FROM ConsultationRecord consultation WHERE consultation.patientByPatientId.patientId = '" + patientId + "'");
            consultationRecordList = (List<ConsultationRecord>)query.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return consultationRecordList;
    }

    public ConsultationRecord getConsultationRecordByConsultationId(String consultationId){
        ConsultationRecord consultationRecord = new ConsultationRecord();

        try {
            Query query = em.createQuery("SELECT consultation FROM ConsultationRecord consultation WHERE consultation.consultationId = '" + consultationId + "'");
            consultationRecord = (ConsultationRecord) query.getSingleResult();
        }catch (Exception e){
            e.printStackTrace();
        }

        return consultationRecord;
    }

}
