package com.springapp.mvc.domain.lathe;

import javax.persistence.*;

@Entity
@Table(name = "sliders_filter", schema = "", catalog = "lathe")
public class SlidersLatheFilterEntity {
    private int id;
    private String productionYear;
    private String price;
    private String xMotionMm;
    private String yMotionMm;
    private String zMotionMm;
    private String maxProcessingDiameterMm;
    private String maxProcessingLengthMm;
    private String xMotionInch;
    private String yMotionInch;
    private String zMotionInch;
    private String maxProcessingDiameterInch;
    private String maxProcessingLengthInch;

    public SlidersLatheFilterEntity() {
        setId(1);
    }

    @Id
    @Column(name = "id", nullable = false, insertable = true, updatable = true)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "productionYear", nullable = false, insertable = true, updatable = true, length = 45)
    public String getProductionYear() {
        return productionYear;
    }

    public void setProductionYear(String productionYear) {
        this.productionYear = productionYear;
    }

    @Basic
    @Column(name = "price", nullable = false, insertable = true, updatable = true, length = 45)
    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    @Basic
    @Column(name = "xMotionMm", nullable = false, insertable = true, updatable = true, length = 45)
    public String getxMotionMm() {
        return xMotionMm;
    }

    public void setxMotionMm(String xMotionMm) {
        this.xMotionMm = xMotionMm;
    }

    @Basic
    @Column(name = "yMotionMm", nullable = false, insertable = true, updatable = true, length = 45)
    public String getyMotionMm() {
        return yMotionMm;
    }

    public void setyMotionMm(String yMotionMm) {
        this.yMotionMm = yMotionMm;
    }

    @Basic
    @Column(name = "zMotionMm", nullable = false, insertable = true, updatable = true, length = 45)
    public String getzMotionMm() {
        return zMotionMm;
    }

    public void setzMotionMm(String zMotionMm) {
        this.zMotionMm = zMotionMm;
    }

    @Basic
    @Column(name = "maxProcessingDiameterMm", nullable = false, insertable = true, updatable = true, length = 45)
    public String getMaxProcessingDiameterMm() {
        return maxProcessingDiameterMm;
    }

    public void setMaxProcessingDiameterMm(String maxProcessingDiameterMm) {
        this.maxProcessingDiameterMm = maxProcessingDiameterMm;
    }

    @Basic
    @Column(name = "maxProcessingLengthMm", nullable = false, insertable = true, updatable = true, length = 45)
    public String getMaxProcessingLengthMm() {
        return maxProcessingLengthMm;
    }

    public void setMaxProcessingLengthMm(String maxProcessingLengthMm) {
        this.maxProcessingLengthMm = maxProcessingLengthMm;
    }

    @Basic
    @Column(name = "xMotionInch", nullable = false, insertable = true, updatable = true, length = 45)
    public String getxMotionInch() {
        return xMotionInch;
    }

    public void setxMotionInch(String xMotionInch) {
        this.xMotionInch = xMotionInch;
    }

    @Basic
    @Column(name = "yMotionInch", nullable = false, insertable = true, updatable = true, length = 45)
    public String getyMotionInch() {
        return yMotionInch;
    }

    public void setyMotionInch(String yMotionInch) {
        this.yMotionInch = yMotionInch;
    }

    @Basic
    @Column(name = "zMotionInch", nullable = false, insertable = true, updatable = true, length = 45)
    public String getzMotionInch() {
        return zMotionInch;
    }

    public void setzMotionInch(String zMotionInch) {
        this.zMotionInch = zMotionInch;
    }

    @Basic
    @Column(name = "maxProcessingDiameterInch", nullable = false, insertable = true, updatable = true, length = 45)
    public String getMaxProcessingDiameterInch() {
        return maxProcessingDiameterInch;
    }

    public void setMaxProcessingDiameterInch(String maxProcessingDiameterInch) {
        this.maxProcessingDiameterInch = maxProcessingDiameterInch;
    }

    @Basic
    @Column(name = "maxProcessingLengthInch", nullable = false, insertable = true, updatable = true, length = 45)
    public String getMaxProcessingLengthInch() {
        return maxProcessingLengthInch;
    }

    public void setMaxProcessingLengthInch(String maxProcessingLengthInch) {
        this.maxProcessingLengthInch = maxProcessingLengthInch;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        SlidersLatheFilterEntity that = (SlidersLatheFilterEntity) o;

        if (id != that.id) return false;
        if (maxProcessingDiameterInch != null ? !maxProcessingDiameterInch.equals(that.maxProcessingDiameterInch) : that.maxProcessingDiameterInch != null)
            return false;
        if (maxProcessingDiameterMm != null ? !maxProcessingDiameterMm.equals(that.maxProcessingDiameterMm) : that.maxProcessingDiameterMm != null)
            return false;
        if (maxProcessingLengthInch != null ? !maxProcessingLengthInch.equals(that.maxProcessingLengthInch) : that.maxProcessingLengthInch != null)
            return false;
        if (maxProcessingLengthMm != null ? !maxProcessingLengthMm.equals(that.maxProcessingLengthMm) : that.maxProcessingLengthMm != null)
            return false;
        if (price != null ? !price.equals(that.price) : that.price != null) return false;
        if (productionYear != null ? !productionYear.equals(that.productionYear) : that.productionYear != null)
            return false;
        if (xMotionInch != null ? !xMotionInch.equals(that.xMotionInch) : that.xMotionInch != null) return false;
        if (xMotionMm != null ? !xMotionMm.equals(that.xMotionMm) : that.xMotionMm != null) return false;
        if (yMotionInch != null ? !yMotionInch.equals(that.yMotionInch) : that.yMotionInch != null) return false;
        if (yMotionMm != null ? !yMotionMm.equals(that.yMotionMm) : that.yMotionMm != null) return false;
        if (zMotionInch != null ? !zMotionInch.equals(that.zMotionInch) : that.zMotionInch != null) return false;
        if (zMotionMm != null ? !zMotionMm.equals(that.zMotionMm) : that.zMotionMm != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (productionYear != null ? productionYear.hashCode() : 0);
        result = 31 * result + (price != null ? price.hashCode() : 0);
        result = 31 * result + (xMotionMm != null ? xMotionMm.hashCode() : 0);
        result = 31 * result + (yMotionMm != null ? yMotionMm.hashCode() : 0);
        result = 31 * result + (zMotionMm != null ? zMotionMm.hashCode() : 0);
        result = 31 * result + (maxProcessingDiameterMm != null ? maxProcessingDiameterMm.hashCode() : 0);
        result = 31 * result + (maxProcessingLengthMm != null ? maxProcessingLengthMm.hashCode() : 0);
        result = 31 * result + (xMotionInch != null ? xMotionInch.hashCode() : 0);
        result = 31 * result + (yMotionInch != null ? yMotionInch.hashCode() : 0);
        result = 31 * result + (zMotionInch != null ? zMotionInch.hashCode() : 0);
        result = 31 * result + (maxProcessingDiameterInch != null ? maxProcessingDiameterInch.hashCode() : 0);
        result = 31 * result + (maxProcessingLengthInch != null ? maxProcessingLengthInch.hashCode() : 0);
        return result;
    }
}
