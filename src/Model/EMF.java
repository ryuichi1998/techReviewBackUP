package Model;

import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

/**
 * Created by liyun on 10/12/16.
 */
public class EMF {
    private static final EntityManagerFactory emfInstance = Persistence.createEntityManagerFactory("mi2");

    public static EntityManagerFactory getInstance() {
        return emfInstance;
    }

    private EMF() {
    }

}
