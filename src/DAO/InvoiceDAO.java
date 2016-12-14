package DAO;

import Entity.Invoice;
import Entity.Service;
import Model.EMF;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import java.util.Date;
import java.util.List;

/**
 * Created by Ryuichi on 14/12/2016.
 */
public class InvoiceDAO {

    private EntityManager em;

    public InvoiceDAO() {
        em = EMF.getInstance().createEntityManager();
    }

    public List<Invoice> retrieveAllService(String status) {
        List<Invoice> invoiceList = null;

        try {
            Query query = em.createQuery("SELECT i from Invoice i");
            invoiceList = query.getResultList();

        } catch(Exception e) {

        }
        return invoiceList;
    }

    public Invoice createInvoice(Invoice inv) {
        em.getTransaction().begin();
        em.persist(inv);
        em.getTransaction().commit();
        return inv;
    }


}
