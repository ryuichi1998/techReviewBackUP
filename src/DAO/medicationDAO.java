package DAO;

import Entity.Product;
import Model.EMF;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import java.util.List;


/**
 * Created by qingyutan on 13/12/16.
 */
public class medicationDAO {

    private EntityManager em;

    public medicationDAO() {
        em = EMF.getInstance().createEntityManager();
    }


    public boolean addNewMedications(Product product) {
        boolean isValid = false;

        try {

            em.getTransaction().begin();
            em.persist(product);
            em.getTransaction().commit();

            isValid = true;

        } catch(Exception e) {
            e.printStackTrace();
        }

        return isValid;
    }


    public List<Product> retrieveAllMedications() {
            List<Product> product = null;

                try {
                    Query query = em.createQuery("SELECT p from Product p");
                    product = query.getResultList();

                } catch(Exception e) {

                }
    return product;
    }


    public Product retrieveBook() {

        return null;
    }




}
