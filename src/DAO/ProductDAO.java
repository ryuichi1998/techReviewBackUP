package DAO;

import Entity.Product;
import Model.EMF;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.persistence.TransactionRequiredException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;


/**
 * Created by qingyutan on 13/12/16.
 */
public class ProductDAO {

    private EntityManager em;
    private Random random = new Random();

    public ProductDAO() {
        em = EMF.getInstance().createEntityManager();
    }


    /* ===================

    Name: addNewProduct
    For: Create Products
    Parameters: object product
    Return type: Boolean

    ===================== */

    public Boolean addNewProduct(Product product) {
        boolean isCreated = false;

        try {
            em.getTransaction().begin();
            em.persist(product);
            em.flush();
            em.getTransaction().commit();
            isCreated = true;
        } catch (Exception e) {
            e.printStackTrace();
            isCreated = false;
        }


        return isCreated;

    }


    /* ===================

    Name: updateProducts
    For: products Products
    Parameters: object product
    Return type: Boolean

    ===================== */

    public Boolean updateProduct(Product product) {

        // check if product is updated
        boolean isUpdated = false;

        // query string

        String queryString = "UPDATE Product p SET p.productName = :pname, p.productType = :ptype, p.productUnit = :punit, p.productQuantity = :pquantity, p.supplierName = :sname, p.supplierPartNo = :spartno, p.supplierPrice = :sprice, p.productPrice = :pprice, p.productDetails = :pdetails " +
                "WHERE p.productCode = :pcode";

        try {


//            System.out.println(product.getProductCode());
//            System.out.println(product.getProductName());
//            System.out.println(product.getProductUnit());
//            System.out.println(product.getProductQuantity());
//            System.out.println(product.getProductType());
//            System.out.println(product.getSupplierName());
//            System.out.println(product.getSupplierPartNo());
//            System.out.println(product.getSupplierPrice());
//            System.out.println(product.getProductPrice());
//            System.out.println(product.getProductDetails());


            Query query = em.createQuery(queryString);
                    query.setParameter("pcode", product.getProductCode());
                    query.setParameter("pname", product.getProductName());
                    query.setParameter("punit", product.getProductUnit());
                    query.setParameter("pquantity",product.getProductQuantity());
                    query.setParameter("ptype", product.getProductType());
                    query.setParameter("sname", product.getSupplierName());
                    query.setParameter("spartno", product.getSupplierPartNo());
                    query.setParameter("sprice", product.getSupplierPrice());
                    query.setParameter("pprice", product.getProductPrice());
                    query.setParameter("pdetails", product.getProductDetails());



            em.getTransaction().begin();
            int updateCount = query.executeUpdate();
            em.flush();


            System.out.println(updateCount);
            if(updateCount > 0) { isUpdated =  true; }
            em.getTransaction().commit();

        } catch(TransactionRequiredException e) {

            e.printStackTrace();
        }



        return isUpdated;
    }



    public Product retrieveProduct() {
        List<Product> list = retrieveAllProduct();
        int i = random.nextInt(list.size());
        return list.get(i);
    }



    public List<Product> retrieveAllProduct() {
            List<Product> product = null;

                try {
                    Query query = em.createQuery("SELECT p from Product p");
                    product = query.getResultList();

                } catch(Exception e) {

                }
    return product;
    }


    public Product retrieveProductDetails(String productcode) {
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

    public String createProductCode() {
        String code = null;

        try {
            Query query = em.createQuery("SELECT p.productCode FROM Product p ORDER BY p.productCode DESC").setMaxResults(1);
            code = (String) query.getSingleResult();
        } catch(Exception e) {
            e.printStackTrace();
        }

        return code;
    }



    // Check is field blank
    public  Boolean isFieldBlank(String field) {
        if(field != null)  { return true; } else { return false;}
    }

    public  Boolean isProductExisted(String productName) {

            Query query = em.createQuery("SELECT COUNT(p.productName) FROM Product p WHERE p.productName=:productname");
            query.setParameter("productname", productName);

            // if exist
            long ifExist = 0;
            // get result
            ifExist = (long) query.getSingleResult();
            // check result
            if (ifExist > 0) { return true; } else { return false;}




    }


    /* ===================

    Name: getLowStockProducts
    For: products Products
    Parameters: =
    Return type: Boolean

    ===================== */

    public List<Product> getLowStockProducts() {
        List<Product> lowStocks = new ArrayList<Product>();
        String queryStr = "SELECT p.productCode, p.productQuantity, p.productName FROM Product p WHERE p.productQuantity < 100";

        try {
            Query query = em.createQuery(queryStr);
            lowStocks = query.getResultList();
        } catch(Exception e) {
            e.printStackTrace();
        }


        return lowStocks;
    }






}
