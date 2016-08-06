package com.springapp.mvc.domain.lathe;

import javax.persistence.*;

@Entity
@Table(name = "lathe_short", schema = "", catalog = "lathe")
public class LatheShortEntity {
    private String productId;
    private String model;
    private String manufacturer;
    private String systemCNC;
    private int productionYear;
    private int maxProcessingDiameterMm;
    private float maxProcessingDiameterInch;
    private int maxProcessingLengthMm;
    private float maxProcessingLengthInch;
    private int xMotionMm;
    private float xMotionInch;
    private int yMotionMm;
    private float yMotionInch;
    private int zMotionMm;
    private float zMotionInch;
    private int price;
    private String photo1;
    private String isSold;

    @Id
    @Column(name = "productId", nullable = false, insertable = true, updatable = true, length = 255)
    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

    @Basic
    @Column(name = "model", nullable = false, insertable = true, updatable = true, length = 255)
    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    @Basic
    @Column(name = "manufacturer", nullable = false, insertable = true, updatable = true, length = 255)
    public String getManufacturer() {
        return manufacturer;
    }

    public void setManufacturer(String manufacturer) {
        this.manufacturer = manufacturer;
    }

    @Basic
    @Column(name = "systemCNC", nullable = false, insertable = true, updatable = true, length = 255)
    public String getSystemCNC() {
        return systemCNC;
    }

    public void setSystemCNC(String systemCnc) {
        this.systemCNC = systemCnc;
    }

    @Basic
    @Column(name = "productionYear", nullable = false, insertable = true, updatable = true)
    public int getProductionYear() {
        return productionYear;
    }

    public void setProductionYear(int productionYear) {
        this.productionYear = productionYear;
    }

    @Basic
    @Column(name = "maxProcessingDiameterMm", nullable = false, insertable = true, updatable = true)
    public int getMaxProcessingDiameterMm() {
        return maxProcessingDiameterMm;
    }

    public void setMaxProcessingDiameterMm(int maxProcessingDiameterMm) {
        this.maxProcessingDiameterMm = maxProcessingDiameterMm;
    }

    @Basic
    @Column(name = "maxProcessingDiameterInch", nullable = false, insertable = true, updatable = true, precision = 1)
    public float getMaxProcessingDiameterInch() {
        return maxProcessingDiameterInch;
    }

    public void setMaxProcessingDiameterInch(float maxProcessingDiameterInch) {
        this.maxProcessingDiameterInch = maxProcessingDiameterInch;
    }

    @Basic
    @Column(name = "maxProcessingLengthMm", nullable = false, insertable = true, updatable = true)
    public int getMaxProcessingLengthMm() {
        return maxProcessingLengthMm;
    }

    public void setMaxProcessingLengthMm(int maxProcessingLengthMm) {
        this.maxProcessingLengthMm = maxProcessingLengthMm;
    }

    @Basic
    @Column(name = "maxProcessingLengthInch", nullable = false, insertable = true, updatable = true, precision = 1)
    public float getMaxProcessingLengthInch() {
        return maxProcessingLengthInch;
    }

    public void setMaxProcessingLengthInch(float maxProcessingLengthInch) {
        this.maxProcessingLengthInch = maxProcessingLengthInch;
    }

    @Basic
    @Column(name = "xMotionMm", nullable = false, insertable = true, updatable = true)
    public int getxMotionMm() {
        return xMotionMm;
    }

    public void setxMotionMm(int xMotionMm) {
        this.xMotionMm = xMotionMm;
    }

    @Basic
    @Column(name = "xMotionInch", nullable = false, insertable = true, updatable = true, precision = 1)
    public float getxMotionInch() {
        return xMotionInch;
    }

    public void setxMotionInch(float xMotionInch) {
        this.xMotionInch = xMotionInch;
    }

    @Basic
    @Column(name = "yMotionMm", nullable = false, insertable = true, updatable = true)
    public int getyMotionMm() {
        return yMotionMm;
    }

    public void setyMotionMm(int yMotionMm) {
        this.yMotionMm = yMotionMm;
    }

    @Basic
    @Column(name = "yMotionInch", nullable = false, insertable = true, updatable = true, precision = 1)
    public float getyMotionInch() {
        return yMotionInch;
    }

    public void setyMotionInch(float yMotionInch) {
        this.yMotionInch = yMotionInch;
    }

    @Basic
    @Column(name = "zMotionMm", nullable = false, insertable = true, updatable = true)
    public int getzMotionMm() {
        return zMotionMm;
    }

    public void setzMotionMm(int zMotionMm) {
        this.zMotionMm = zMotionMm;
    }

    @Basic
    @Column(name = "zMotionInch", nullable = false, insertable = true, updatable = true, precision = 1)
    public float getzMotionInch() {
        return zMotionInch;
    }

    public void setzMotionInch(float zMotionInch) {
        this.zMotionInch = zMotionInch;
    }

    @Basic
    @Column(name = "price", nullable = false, insertable = true, updatable = true)
    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    @Basic
    @Column(name = "photo1", nullable = false, insertable = true, updatable = true, length = 255)
    public String getPhoto1() {
        return photo1;
    }

    public void setPhoto1(String photo1) {
        this.photo1 = photo1;
    }

    @Basic
    @Column(name = "isSold", nullable = false, insertable = true, updatable = true, length = 45)
    public String getIsSold() {
        return isSold;
    }

    public void setIsSold(String isSold) {
        this.isSold = isSold;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        LatheShortEntity that = (LatheShortEntity) o;

        if (Float.compare(that.maxProcessingDiameterInch, maxProcessingDiameterInch) != 0) return false;
        if (maxProcessingDiameterMm != that.maxProcessingDiameterMm) return false;
        if (Float.compare(that.maxProcessingLengthInch, maxProcessingLengthInch) != 0) return false;
        if (maxProcessingLengthMm != that.maxProcessingLengthMm) return false;
        if (price != that.price) return false;
        if (productionYear != that.productionYear) return false;
        if (Float.compare(that.xMotionInch, xMotionInch) != 0) return false;
        if (xMotionMm != that.xMotionMm) return false;
        if (Float.compare(that.yMotionInch, yMotionInch) != 0) return false;
        if (yMotionMm != that.yMotionMm) return false;
        if (Float.compare(that.zMotionInch, zMotionInch) != 0) return false;
        if (zMotionMm != that.zMotionMm) return false;
        if (isSold != null ? !isSold.equals(that.isSold) : that.isSold != null) return false;
        if (manufacturer != null ? !manufacturer.equals(that.manufacturer) : that.manufacturer != null) return false;
        if (model != null ? !model.equals(that.model) : that.model != null) return false;
        if (photo1 != null ? !photo1.equals(that.photo1) : that.photo1 != null) return false;
        if (productId != null ? !productId.equals(that.productId) : that.productId != null) return false;
        if (systemCNC != null ? !systemCNC.equals(that.systemCNC) : that.systemCNC != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = productId != null ? productId.hashCode() : 0;
        result = 31 * result + (model != null ? model.hashCode() : 0);
        result = 31 * result + (manufacturer != null ? manufacturer.hashCode() : 0);
        result = 31 * result + (systemCNC != null ? systemCNC.hashCode() : 0);
        result = 31 * result + productionYear;
        result = 31 * result + maxProcessingDiameterMm;
        result = 31 * result + (maxProcessingDiameterInch != +0.0f ? Float.floatToIntBits(maxProcessingDiameterInch) : 0);
        result = 31 * result + maxProcessingLengthMm;
        result = 31 * result + (maxProcessingLengthInch != +0.0f ? Float.floatToIntBits(maxProcessingLengthInch) : 0);
        result = 31 * result + xMotionMm;
        result = 31 * result + (xMotionInch != +0.0f ? Float.floatToIntBits(xMotionInch) : 0);
        result = 31 * result + yMotionMm;
        result = 31 * result + (yMotionInch != +0.0f ? Float.floatToIntBits(yMotionInch) : 0);
        result = 31 * result + zMotionMm;
        result = 31 * result + (zMotionInch != +0.0f ? Float.floatToIntBits(zMotionInch) : 0);
        result = 31 * result + price;
        result = 31 * result + (photo1 != null ? photo1.hashCode() : 0);
        result = 31 * result + (isSold != null ? isSold.hashCode() : 0);
        return result;
    }
}
