package DAO;

import Entity.Servdetails;
import Model.EMF;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;

/**
 * Created by Ryuichi on 2/2/2017.
 */
public class ServDetailsDAO {

    private EntityManager em;
    private EntityManagerFactory entityManagerFactory;

    public ServDetailsDAO() {
        em = EMF.getInstance().createEntityManager();
    }

    public Servdetails createServdetails(Servdetails servdetails) {
        em.getTransaction().begin();
        em.persist(servdetails);
        em.flush();
        em.getTransaction().commit();
        return servdetails;
    }

    public Servdetails getServDetailsByServDetailsId(int servDetailsId){

        Servdetails servdetails = null;

        try {
            servdetails = em.find(Servdetails.class, servDetailsId);
        }catch (Exception e){
            e.printStackTrace();
        }

        return servdetails;
    }
}
