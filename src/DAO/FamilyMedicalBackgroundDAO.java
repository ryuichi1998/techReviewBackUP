package DAO;

import Entity.FamilyMedicalBackground;
import Model.EMF;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by liyun on 14/12/16.
 */
public class FamilyMedicalBackgroundDAO {

    private EntityManager em;

    public FamilyMedicalBackgroundDAO() {
        em = EMF.getInstance().createEntityManager();
    }

    public List<FamilyMedicalBackground> getFamilyMedicalBackgroundListByPatientId(String patientId) {
        List<FamilyMedicalBackground> familyMedicalBackgroundList = new ArrayList<FamilyMedicalBackground>();

        System.out.println(patientId);
        try {
            Query query = em.createQuery("SELECT familyMedicalBackground FROM FamilyMedicalBackground familyMedicalBackground WHERE familyMedicalBackground.patientByPatientId.patientId = '" + patientId + "'");
            familyMedicalBackgroundList = (List<FamilyMedicalBackground>) query.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
        }

        for(FamilyMedicalBackground c :familyMedicalBackgroundList){
            System.out.println(c.getConditionName());
        }

        return familyMedicalBackgroundList;
    }
}
