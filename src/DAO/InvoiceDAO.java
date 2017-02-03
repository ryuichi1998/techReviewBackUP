package DAO;

import Entity.ConsultationRecord;
import Entity.Invoice;
import Entity.Patient;
import Model.EMF;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Ryuichi on 14/12/2016.
 */
public class InvoiceDAO {

    private EntityManager em;
    private EntityManagerFactory entityManagerFactory;

    public InvoiceDAO() {
        em = EMF.getInstance().createEntityManager();
    }

//    public List<Invoice> retrieveAllService(String patientId) {
//        List<Invoice> invoiceList = null;
//
//        try {
//            Query query = em.createQuery("SELECT i from Invoice i where i.patientId=:patientId");
//            query.setParameter("patientId", patientId);
//            invoiceList = query.getResultList();
//
//        } catch(Exception e) {
//
//        }
//        return invoiceList;
//    }

    public Invoice createInvoice(Invoice inv) {
        em.getTransaction().begin();
        em.persist(inv);
        em.flush();
        em.getTransaction().commit();
        return inv;
    }

    public Invoice getInvoiceByInvoiceId (int invoiceId){

        Invoice invoice = null;

        try {
            invoice = em.find(Invoice.class, invoiceId);
        }catch (Exception e){
            e.printStackTrace();
        }

        return invoice;

    }

    public Invoice getLatest() {
        Invoice invoice = new Invoice();

        try {
            Query query = em.createQuery("select i from Invoice i order by i.invoiceId desc");
            invoice = (Invoice) query.setMaxResults(1).getSingleResult();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return invoice;
    }

    public List<Invoice> getInvoiceListByPatientId(String patientId) {
        List<Invoice> invoiceListByPatientId = new ArrayList<Invoice>();

        try {
            Query query = em.createQuery("SELECT invoice FROM Invoice invoice WHERE invoice.patientByPatientId.patientId = '" + patientId + "'");
            invoiceListByPatientId = (List<Invoice>)query.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return invoiceListByPatientId;
    }


}
