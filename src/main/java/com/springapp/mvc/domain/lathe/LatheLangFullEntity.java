package com.springapp.mvc.domain.lathe;

import javax.persistence.*;

@Entity
@Table(name = "lathe_lang_full", schema = "", catalog = "lathe")
public class LatheLangFullEntity {
    @EmbeddedId
    private LatheLangFullEntityPK latheLangFullEntityPK;

    @Basic
    @Column(name = "counterSpindlePresence", nullable = true, insertable = true, updatable = true, length = 255)
    private String counterSpindlePresence;

    @Basic
    @Column(name = "turretFasteningType", nullable = true, insertable = true, updatable = true, length = 255)
    private String turretFasteningType;

    @Basic
    @Column(name = "tailstockPresence", nullable = true, insertable = true, updatable = true, length = 255)
    private String tailstockPresence;

    public LatheLangFullEntity() {
        latheLangFullEntityPK = new LatheLangFullEntityPK();
    }

    public LatheLangFullEntityPK getLatheLangFullEntityPK() {
        return latheLangFullEntityPK;
    }

    public void setLatheLangFullEntityPK(LatheLangFullEntityPK latheLangFullEntityPK) {
        this.latheLangFullEntityPK = latheLangFullEntityPK;
    }

    public String getCounterSpindlePresence() {
        return counterSpindlePresence;
    }

    public void setCounterSpindlePresence(String counterSpindlePresence) {
        this.counterSpindlePresence = counterSpindlePresence;
    }

    public String getTurretFasteningType() {
        return turretFasteningType;
    }

    public void setTurretFasteningType(String turretFasteningType) {
        this.turretFasteningType = turretFasteningType;
    }

    public String getTailstockPresence() {
        return tailstockPresence;
    }

    public void setTailstockPresence(String tailstockPresence) {
        this.tailstockPresence = tailstockPresence;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        LatheLangFullEntity that = (LatheLangFullEntity) o;

        if (counterSpindlePresence != null ? !counterSpindlePresence.equals(that.counterSpindlePresence) : that.counterSpindlePresence != null)
            return false;
        if (tailstockPresence != null ? !tailstockPresence.equals(that.tailstockPresence) : that.tailstockPresence != null)
            return false;
        if (turretFasteningType != null ? !turretFasteningType.equals(that.turretFasteningType) : that.turretFasteningType != null)
            return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = counterSpindlePresence != null ? counterSpindlePresence.hashCode() : 0;
        result = 31 * result + (turretFasteningType != null ? turretFasteningType.hashCode() : 0);
        result = 31 * result + (tailstockPresence != null ? tailstockPresence.hashCode() : 0);
        return result;
    }

}
