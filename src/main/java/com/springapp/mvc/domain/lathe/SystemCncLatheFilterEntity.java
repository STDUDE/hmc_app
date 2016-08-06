package com.springapp.mvc.domain.lathe;

import javax.persistence.*;

@Entity
@Table(name = "system_cnc_filter", schema = "", catalog = "lathe")
public class SystemCncLatheFilterEntity {
    private String systemCNC;
    private Integer num;

    public SystemCncLatheFilterEntity() {}

    public SystemCncLatheFilterEntity(String systemCNC, Integer num) {
        this.systemCNC = systemCNC;
        this.num = num;
    }

    @Id
    @Column(name = "systemCNC", nullable = false, insertable = true, updatable = true, length = 255)
    public String getSystemCNC() {
        return systemCNC;
    }

    public void setSystemCNC(String systemCnc) {
        this.systemCNC = systemCnc;
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

        SystemCncLatheFilterEntity that = (SystemCncLatheFilterEntity) o;

        if (num != null ? !num.equals(that.num) : that.num != null) return false;
        if (systemCNC != null ? !systemCNC.equals(that.systemCNC) : that.systemCNC != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = systemCNC != null ? systemCNC.hashCode() : 0;
        result = 31 * result + (num != null ? num.hashCode() : 0);
        return result;
    }
}
