package DAO;

import Entity.Invoice;
import Entity.Service;
import Model.EMF;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import java.util.List;
import java.util.Random;

/**
 * Created by Ryuichi on 14/12/2016.
 */
public class ServiceDAO {

    private EntityManager em;
    private Random random = new Random();

    public ServiceDAO() {
        em = EMF.getInstance().createEntityManager();
    }

    public List<Service> retrieveAllService() {
        List<Service> serviceList = null;

        try {
            Query query = em.createQuery("SELECT s FROM Service s ");
            serviceList = query.getResultList();

        } catch(Exception e) {

        }
        return serviceList;
    }

    public Service getService(String serviceId) {
        Service service = null;
        try {
            Query query = em.createQuery("select s from Service s where s.serviceId =:serviceId");
            query.setParameter("serviceId", new Integer(serviceId));
            service = (Service) query.getSingleResult();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return service;
    }

    public Service getServiceByServiceId (int serviceId){

        Service service = null;

        try {
            service = em.find(Service.class, serviceId);
        }catch (Exception e){
            e.printStackTrace();
        }

        return service;

    }

//    public List<Service> retrieveAllService(String patientId) {
//        List<Service> serviceList = null;
//
//        try {
//            String status = "false";
//            Query query = em.createQuery("SELECT s from Service s where s.patientId =:patientId and s.servicePaymentStatus=:status");
//            query.setParameter("patientId", patientId);
//            query.setParameter("status", status);
//            serviceList = query.getResultList();
//
//        } catch(Exception e) {
//
//        }
//        return serviceList;
//    }
//
//    public void updateInvoiceId(int invoiceId, String patientId) {
//        try {
//            String status = "false";
//            em.getTransaction().begin();
//            Query query = em.createQuery("UPDATE  Service s SET s.invoiceId =:invoiceId where s.patientId =:patientId and s.servicePaymentStatus=:status");
//            query.setParameter("invoiceId", invoiceId);
//            query.setParameter("patientId", patientId);
//            query.setParameter("status", status);
//            query.executeUpdate();
//            String updateStatus = "true";
//            em.getTransaction().commit();
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//    }
//
//    public void updateStatus(String patientId) {
//        try {
//            String status = "false";
//            String updateStatus = "true";
//            em.getTransaction().begin();
//            Query query = em.createQuery("UPDATE  Service s SET s.servicePaymentStatus =:updateStatus where s.patientId =:patientId and s.servicePaymentStatus=:status");
//            query.setParameter("patientId", patientId);
//            query.setParameter("status", status);
//            query.setParameter("updateStatus", updateStatus);
//            query.executeUpdate();
//            em.getTransaction().commit();
//        }  catch (Exception e) {
//            e.printStackTrace();
//        }
//    }

}
