package com.springapp.mvc.domain.hmc;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="sliders_filter", schema = "", catalog = "hmc")
public class SlidersFilter {
    @Id
    @Column(name = "id")
    private int id;

    @Column(name = "productionYear")
    private String productionYear;

    @Column(name = "price")
    private String price;

    @Column(name = "xMotion")
    private String xMotion;

    @Column(name = "yMotion")
    private String yMotion;

    @Column(name = "zMotion")
    private String zMotion;

    @Column(name = "xTableSize")
    private String xTableSize;

    @Column(name = "yTableSize")
    private String yTableSize;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getProductionYear() {
        return productionYear;
    }

    public void setProductionYear(String productionYear) {
        this.productionYear = productionYear;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getxMotion() {
        return xMotion;
    }

    public void setxMotion(String xMotion) {
        this.xMotion = xMotion;
    }

    public String getyMotion() {
        return yMotion;
    }

    public void setyMotion(String yMotion) {
        this.yMotion = yMotion;
    }

    public String getzMotion() {
        return zMotion;
    }

    public void setzMotion(String zMotion) {
        this.zMotion = zMotion;
    }

    public String getxTableSize() {
        return xTableSize;
    }

    public void setxTableSize(String xTableSize) {
        this.xTableSize = xTableSize;
    }

    public String getyTableSize() {
        return yTableSize;
    }

    public void setyTableSize(String yTableSize) {
        this.yTableSize = yTableSize;
    }
}
