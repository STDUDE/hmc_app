package com.springapp.mvc.domain.lathe;


import javax.persistence.*;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "lathe_lang_short", schema = "", catalog = "lathe")
public class LatheLangShortEntity {
    @EmbeddedId
    private LatheLangShortEntityPK latheLangShortEntityPK;

    @Basic
    @Column(name = "machineType", nullable = false, insertable = true, updatable = true, length = 255)
    private String machineType;

    @Basic
    @Column(name = "producingCountry", nullable = false, insertable = true, updatable = true, length = 255)
    private String producingCountry;

    @Basic
    @Column(name = "machineCondition", nullable = false, insertable = true, updatable = true, length = 255)
    private String machineCondition;

    @Basic
    @Column(name = "machineLocation", nullable = false, insertable = true, updatable = true, length = 255)
    private String machineLocation;

    @Basic
    @Column(name = "description", nullable = false, insertable = true, updatable = true, length = 1023)
    private String description;

    public LatheLangShortEntity() {
        this.latheLangShortEntityPK = new LatheLangShortEntityPK();
    }

    public LatheLangShortEntityPK getLatheLangShortEntityPK() {
        return latheLangShortEntityPK;
    }

    public void setLatheLangShortEntityPK(LatheLangShortEntityPK latheLangShortEntityPK) {
        this.latheLangShortEntityPK = latheLangShortEntityPK;
    }

    public String getMachineType() {
        return machineType;
    }

    public void setMachineType(String machineType) {
        this.machineType = machineType;
    }

    public String getProducingCountry() {
        return producingCountry;
    }

    public void setProducingCountry(String producingCountry) {
        this.producingCountry = producingCountry;
    }

    public String getMachineCondition() {
        return machineCondition;
    }

    public void setMachineCondition(String machineCondition) {
        this.machineCondition = machineCondition;
    }

    public String getMachineLocation() {
        return machineLocation;
    }

    public void setMachineLocation(String machineLocation) {
        this.machineLocation = machineLocation;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        LatheLangShortEntity that = (LatheLangShortEntity) o;

        if (description != null ? !description.equals(that.description) : that.description != null) return false;
        if (machineCondition != null ? !machineCondition.equals(that.machineCondition) : that.machineCondition != null)
            return false;
        if (machineLocation != null ? !machineLocation.equals(that.machineLocation) : that.machineLocation != null)
            return false;
        if (machineType != null ? !machineType.equals(that.machineType) : that.machineType != null) return false;
        if (producingCountry != null ? !producingCountry.equals(that.producingCountry) : that.producingCountry != null)
            return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = machineType != null ? machineType.hashCode() : 0;
        result = 31 * result + (producingCountry != null ? producingCountry.hashCode() : 0);
        result = 31 * result + (machineCondition != null ? machineCondition.hashCode() : 0);
        result = 31 * result + (machineLocation != null ? machineLocation.hashCode() : 0);
        result = 31 * result + (description != null ? description.hashCode() : 0);

        return result;
    }

}
