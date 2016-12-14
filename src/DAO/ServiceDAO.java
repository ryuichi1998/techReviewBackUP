package DAO;

import Entity.Service;
import Model.EMF;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import java.util.List;

/**
 * Created by Ryuichi on 14/12/2016.
 */
public class ServiceDAO {

    private EntityManager em;

    public ServiceDAO() {
        em = EMF.getInstance().createEntityManager();
    }

    public List<Service> retrieveAllService(String patientId, String paymentStatus) {
        List<Service> serviceList = null;

        try {
            Query query = em.createQuery("SELECT s from Service s where s.patientId =:patientId and s.servicePaymentStatus=:paymentStatus");
            query.setParameter("patientId", patientId);
            query.setParameter("paymentStatus", paymentStatus);
            serviceList = query.getResultList();

        } catch(Exception e) {

        }
        return serviceList;
    }
}
