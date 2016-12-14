package DAO;

import Entity.VitalSigns;
import Model.EMF;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import java.util.ArrayList;
import java.util.List;

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
}
