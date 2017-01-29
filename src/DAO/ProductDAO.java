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

        String queryString = "UPDATE Product SET productName = :pname, productType = :ptype, productUnit = :punit, productQuantity = :pquantity, supplierName = :sname, supplierPartNo = :spartno, supplierPrice = :sprice, productPrice = :pprice, productDetails = :pdetails " +
                "WHERE productCode = :pcode";

        try {



            Query query = em.createQuery(queryString)
                    .setParameter("pname", product.getProductName())
                    .setParameter("punit", product.getProductUnit())
                    .setParameter("pquantity",product.getProductQuantity())
                    .setParameter("ptype", product.getProductType())
                    .setParameter("sname", product.getSupplierName())
                    .setParameter("spartno", product.getSupplierPartNo())
                    .setParameter("sprice", product.getSupplierPrice())
                    .setParameter("pprice", product.getProductPrice())
                    .setParameter("pdetails", product.getProductDetails())
                    ;

            int updateCount = query.executeUpdate();

            if(updateCount >= 9) {
                isUpdated =  true;
            }

        } catch(Exception e) {

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






}
