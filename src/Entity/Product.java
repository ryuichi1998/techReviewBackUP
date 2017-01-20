package Entity;

import javax.persistence.*;
import java.sql.Date;
import java.util.Collection;

/**
 * Created by liyun on 10/12/16.
 */
@Entity
public class Product {
    private int productId;
    private String productName;
    private String productType;
    private String productUnit;
    private Integer productQuantity;
    private Double productPrice;
    private String productDetails;
    private String supplierName;
    private Integer supplierPartNo;
    private Double supplierPrice;
    private Date importedDate;
    private String productCode;
    private Collection<Medication> medicationListByProductList;



    // CONSTRUCTOR

    public Product() {
    }


    public Product(String productName, String productType, String productUnit, Integer productQuantity, Double productPrice, String productDetails, String supplierName, Integer supplierPartNo, Double supplierPrice, String productCode) {
        this.productName = productName;
        this.productType = productType;
        this.productUnit = productUnit;
        this.productQuantity = productQuantity;
        this.productPrice = productPrice;
        this.productDetails = productDetails;
        this.supplierName = supplierName;
        this.supplierPartNo = supplierPartNo;
        this.supplierPrice = supplierPrice;
        this.productCode = productCode;
    }

    public Product(String productName, String productType, String productUnit, Integer productQuantity, Double productPrice, String productDetails, String supplierName, Integer supplierPartNo, Double supplierPrice, Date importedDate, String productCode) {
        this.productName = productName;
        this.productType = productType;
        this.productUnit = productUnit;
        this.productQuantity = productQuantity;
        this.productPrice = productPrice;
        this.productDetails = productDetails;
        this.supplierName = supplierName;
        this.supplierPartNo = supplierPartNo;
        this.supplierPrice = supplierPrice;
        this.importedDate = importedDate;
        this.productCode = productCode;
    }




    @Id
    @Column(name = "productId", nullable = false)
    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    @Basic
    @Column(name = "productName", nullable = true, length = 45)
    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    @Basic
    @Column(name = "productType", nullable = true, length = 45)
    public String getProductType() {
        return productType;
    }

    public void setProductType(String productType) {
        this.productType = productType;
    }

    @Basic
    @Column(name = "productUnit", nullable = true, length = 45)
    public String getProductUnit() {
        return productUnit;
    }

    public void setProductUnit(String productUnit) {
        this.productUnit = productUnit;
    }

    @Basic
    @Column(name = "productQuantity", nullable = true)
    public Integer getProductQuantity() {
        return productQuantity;
    }

    public void setProductQuantity(Integer productQuantity) {
        this.productQuantity = productQuantity;
    }

    @Basic
    @Column(name = "productPrice", nullable = true, precision = 0)
    public Double getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(Double productPrice) {
        this.productPrice = productPrice;
    }

    @Basic
    @Column(name = "productDetails", nullable = true, length = 45)
    public String getProductDetails() {
        return productDetails;
    }

    public void setProductDetails(String productDetails) {
        this.productDetails = productDetails;
    }

    @Basic
    @Column(name = "supplierName", nullable = true, length = 45)
    public String getSupplierName() {
        return supplierName;
    }

    public void setSupplierName(String supplierName) {
        this.supplierName = supplierName;
    }

    @Basic
    @Column(name = "supplierPartNo", nullable = true)
    public Integer getSupplierPartNo() {
        return supplierPartNo;
    }

    public void setSupplierPartNo(Integer supplierPartNo) {
        this.supplierPartNo = supplierPartNo;
    }

    @Basic
    @Column(name = "supplierPrice", nullable = true, precision = 0)
    public Double getSupplierPrice() {
        return supplierPrice;
    }

    public void setSupplierPrice(Double supplierPrice) {
        this.supplierPrice = supplierPrice;
    }

    @Basic
    @Column(name = "importedDate", nullable = true)
    public Date getImportedDate() {
        return importedDate;
    }

    public void setImportedDate(Date importedDate) {
        this.importedDate = importedDate;
    }

    @Basic
    @Column(name = "productCode", nullable = true, length = 45)
    public String getProductCode() {
        return productCode;
    }

    public void setProductCode(String productCode) {
        this.productCode = productCode;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Product product = (Product) o;

        if (productId != product.productId) return false;
        if (productName != null ? !productName.equals(product.productName) : product.productName != null) return false;
        if (productType != null ? !productType.equals(product.productType) : product.productType != null) return false;
        if (productUnit != null ? !productUnit.equals(product.productUnit) : product.productUnit != null) return false;
        if (productQuantity != null ? !productQuantity.equals(product.productQuantity) : product.productQuantity != null)
            return false;
        if (productPrice != null ? !productPrice.equals(product.productPrice) : product.productPrice != null)
            return false;
        if (productDetails != null ? !productDetails.equals(product.productDetails) : product.productDetails != null)
            return false;
        if (supplierName != null ? !supplierName.equals(product.supplierName) : product.supplierName != null)
            return false;
        if (supplierPartNo != null ? !supplierPartNo.equals(product.supplierPartNo) : product.supplierPartNo != null)
            return false;
        if (supplierPrice != null ? !supplierPrice.equals(product.supplierPrice) : product.supplierPrice != null)
            return false;
        if (importedDate != null ? !importedDate.equals(product.importedDate) : product.importedDate != null)
            return false;
        if (productCode != null ? !productCode.equals(product.productCode) : product.productCode != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = productId;
        result = 31 * result + (productName != null ? productName.hashCode() : 0);
        result = 31 * result + (productType != null ? productType.hashCode() : 0);
        result = 31 * result + (productUnit != null ? productUnit.hashCode() : 0);
        result = 31 * result + (productQuantity != null ? productQuantity.hashCode() : 0);
        result = 31 * result + (productPrice != null ? productPrice.hashCode() : 0);
        result = 31 * result + (productDetails != null ? productDetails.hashCode() : 0);
        result = 31 * result + (supplierName != null ? supplierName.hashCode() : 0);
        result = 31 * result + (supplierPartNo != null ? supplierPartNo.hashCode() : 0);
        result = 31 * result + (supplierPrice != null ? supplierPrice.hashCode() : 0);
        result = 31 * result + (importedDate != null ? importedDate.hashCode() : 0);
        result = 31 * result + (productCode != null ? productCode.hashCode() : 0);
        return result;
    }

    @OneToMany(mappedBy = "productByProductId")
    public Collection<Medication> getMedicationListByProductList() {
        return medicationListByProductList;
    }

    public void setMedicationListByProductList(Collection<Medication> medicationListByProductList) {
        this.medicationListByProductList = medicationListByProductList;
    }
}

