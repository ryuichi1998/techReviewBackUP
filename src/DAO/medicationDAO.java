package DAO;

import Entity.Product;
import Model.EMF;

import javax.persistence.EntityManager;
import javax.persistence.Query;


/**
 * Created by qingyutan on 13/12/16.
 */
public class medicationDAO {

    private EntityManager em;

    public medicationDAO() {
        em = EMF.getInstance().createEntityManager();
    }


    public void addNewMedications(Product product) {
        try {

            em.getTransaction().begin();
            em.persist(product);
            em.getTransaction().commit();

        } catch(Exception e) {
            e.printStackTrace();
        }
    }


    public void retrieveAllMedications() {

    }




}
