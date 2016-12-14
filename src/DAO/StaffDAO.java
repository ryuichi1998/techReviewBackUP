package DAO;

import Entity.Staff;
import Model.EMF;

import javax.persistence.EntityManager;

/**
 * Created by liyun on 10/12/16.
 */
public class StaffDAO {

    private EntityManager em;


    public StaffDAO(){
        em = EMF.getInstance().createEntityManager();
    }

    public Staff getStaffByStaffId(String staffId){
        Staff staff = null;

        try {
            staff = em.find(Staff.class, staffId);
        }catch (Exception e){
            e.printStackTrace();
        }
        return staff;
    }

}
