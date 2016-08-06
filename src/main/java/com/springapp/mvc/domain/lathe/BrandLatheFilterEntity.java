package com.springapp.mvc.domain.lathe;

import javax.persistence.*;

@Entity
@Table(name = "brand_filter", schema = "", catalog = "lathe")
public class BrandLatheFilterEntity {
    private String brand;
    private Integer num;

    public BrandLatheFilterEntity(){}

    public BrandLatheFilterEntity(String field, Integer num) {
        this.brand = field;
        this.num = num;
    }

    @Id
    @Column(name = "brand", nullable = false, insertable = true, updatable = true, length = 255)
    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    @Basic
    @Column(name = "num", nullable = true, insertable = true, updatable = true)
    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        BrandLatheFilterEntity that = (BrandLatheFilterEntity) o;

        if (brand != null ? !brand.equals(that.brand) : that.brand != null) return false;
        if (num != null ? !num.equals(that.num) : that.num != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = brand != null ? brand.hashCode() : 0;
        result = 31 * result + (num != null ? num.hashCode() : 0);
        return result;
    }
}
