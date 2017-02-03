package DAO;

import Entity.Faq;
import Model.EMF;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.Query;
import java.util.List;
import java.util.Random;

/**
 * Created by qingyutan on 2/2/17.
 */
public class FaqDAO {

    private EntityManager em;
    private Random random = new Random();

    public FaqDAO() {
        em = EMF.getInstance().createEntityManager();
    }


    public Boolean createNewArticle(Faq faq) {
        boolean isSaved = false;

        try {
            em.getTransaction().begin();
            em.persist(faq);
            em.flush();
            em.getTransaction().commit();
            isSaved = true;
        } catch (Exception e) {
            e.printStackTrace();
            isSaved = false;
        }
        return isSaved;

    }


      /* ===================

    Name: retrieveLatestArticleID
    For: Retrieve the latest article id if starts from nothing, it will add one
    Parameters: Nil
    Return type: Integer

    ===================== */

    public int retrieveLatestArticleID() {
        int currentValue = 0;

        try {

            Query query = em.createQuery("SELECT f.articleid FROM Faq f ORDER BY f.articleid DESC").setMaxResults(1);
            currentValue = (Integer) query.getSingleResult();

        } catch(NoResultException e) {
           return 0;
        }

        return currentValue;
    }


    /* ===================

    Name: retrieveAllArticles
    For: Retrieve all articles but maximum 10 articles
    Parameters: Nil
    Return type: List

    ===================== */

    public List<Faq> retrieveAllArticles() {
        List<Faq> faq = null;

        try {
            Query query = em.createQuery("SELECT f from Faq f").setMaxResults(10);
            faq = query.getResultList();

        } catch(Exception e) {
            return null;
        }
        return faq;
    }

    public Faq retrieveArticleDetails(int id) {
        Faq details = null;

        try {
            Query query = em.createQuery("SELECT f from Faq f where f.articleid = " + id);
            details = (Faq)query.getSingleResult();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return details;
    }



}
