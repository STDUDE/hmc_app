package com.springapp.mvc.domain.lathe;

import javax.persistence.*;

@Entity
@Table(name = "machine_location_filter", schema = "", catalog = "lathe")
public class MachineLocationLatheFilterEntity {
    private String machineLocation;
    private Integer num;

    public MachineLocationLatheFilterEntity() {}

    public MachineLocationLatheFilterEntity(String machineLocation, Integer num) {
        this.machineLocation = machineLocation;
        this.num = num;
    }

    @Id
    @Column(name = "machineLocation", nullable = false, insertable = true, updatable = true, length = 255)
    public String getMachineLocation() {
        return machineLocation;
    }

    public void setMachineLocation(String machineLocation) {
        this.machineLocation = machineLocation;
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

        MachineLocationLatheFilterEntity that = (MachineLocationLatheFilterEntity) o;

        if (machineLocation != null ? !machineLocation.equals(that.machineLocation) : that.machineLocation != null)
            return false;
        if (num != null ? !num.equals(that.num) : that.num != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = machineLocation != null ? machineLocation.hashCode() : 0;
        result = 31 * result + (num != null ? num.hashCode() : 0);
        return result;
    }
}
