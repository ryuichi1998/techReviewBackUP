package DAO;

import Entity.Product;
import Model.EMF;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import java.sql.Date;
import java.util.List;
import java.util.Random;


/**
 * Created by qingyutan on 13/12/16.
 */
public class productDAO {

    private EntityManager em;
    private Random random = new Random();

    public productDAO() {
        em = EMF.getInstance().createEntityManager();
    }


    public Product addNewMedications(String name, String type, String unit, int quantity, double price, String details, String sname, int spartno, double sprice, Date importDate, String productcode) {

                Product product = new Product(name, type, unit ,quantity, price, details, sname, spartno, sprice, importDate, productcode);

                em.getTransaction().begin();
                em.persist(product);
                em.flush();
                em.getTransaction().commit();

            return product;
    }

    public Product retrieveMedications() {
        List<Product> list = retrieveAllMedications();
        int i = random.nextInt(list.size());
        return list.get(i);
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


    public Product retrieveMedicationDetails(String productcode) {
        Product p = null;

        try {
            Query query = em.createQuery("SELECT p from Product p where p.productCode = '" + productcode + "'");
            p = (Product)query.getSingleResult();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return p;
    }

    public Product retrieveProductCode() {
        Product p = null;

        try {
            Query query = em.createQuery("SELECT p from Product p where p.productCode = '" + p + "'");
        } catch (Exception e) {
            e.printStackTrace();
        }

        return p;
    }




}
