package com.springapp.mvc.domain.hmc;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="system_cnc_filter", schema = "", catalog = "hmc")
public class SystemCNCFilter {
    @Id
    @Column(name = "systemCNC")
    private String systemCNC;

    @Column(name = "num")
    private int num;

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public String getSystemCNC() {
        return systemCNC;
    }

    public void setSystemCNC(String systemCNC) {
        this.systemCNC = systemCNC;
    }
}
