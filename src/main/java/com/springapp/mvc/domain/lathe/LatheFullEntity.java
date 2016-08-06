package com.springapp.mvc.domain.lathe;

import javax.persistence.*;
import java.util.Collection;

@Entity
@Table(name = "lathe_full", schema = "", catalog = "lathe")
public class LatheFullEntity {
    private String productId;
    private String fullSystemCnc;
    private String spindleRotationFreq;
    private String spindlePower;
    private String counterSpindleRotationFreq;
    private String drivenToolsCount;
    private String nonDrivenToolsCount;
    private String processingDiameterMm;
    private String processingDiameterInch;
    private String rodPassageDiameterMm;
    private String rodPassageDiameterInch;
    private String spindleHoleDiameterMm;
    private String spindleHoleDiameterInch;
    private String positionRepositionPrecisionMm;
    private String positionRepositionPrecisionInch;
    private String positionPrecision;
    private String spindleLife;
    private String machineLaunchingTime;
    private String photo2;
    private String photo3;
    private String photo4;
    private String photo5;
    private String video1;
    private String video2;
    private String video3;

    @Id
    @Column(name = "productId", nullable = false, insertable = true, updatable = true, length = 255)
    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

    @Basic
    @Column(name = "fullSystemCNC", nullable = true, insertable = true, updatable = true, length = 255)
    public String getFullSystemCnc() {
        return fullSystemCnc;
    }

    public void setFullSystemCnc(String fullSystemCnc) {
        this.fullSystemCnc = fullSystemCnc;
    }

    @Basic
    @Column(name = "spindleRotationFreq", nullable = true, insertable = true, updatable = true, length = 255)
    public String getSpindleRotationFreq() {
        return spindleRotationFreq;
    }

    public void setSpindleRotationFreq(String spindleRotationFreq) {
        this.spindleRotationFreq = spindleRotationFreq;
    }

    @Basic
    @Column(name = "spindlePower", nullable = true, insertable = true, updatable = true, length = 255)
    public String getSpindlePower() {
        return spindlePower;
    }

    public void setSpindlePower(String spindlePower) {
        this.spindlePower = spindlePower;
    }

    @Basic
    @Column(name = "counterSpindleRotationFreq", nullable = true, insertable = true, updatable = true, length = 255)
    public String getCounterSpindleRotationFreq() {
        return counterSpindleRotationFreq;
    }

    public void setCounterSpindleRotationFreq(String counterSpindleRotationFreq) {
        this.counterSpindleRotationFreq = counterSpindleRotationFreq;
    }

    @Basic
    @Column(name = "drivenToolsCount", nullable = true, insertable = true, updatable = true, length = 255)
    public String getDrivenToolsCount() {
        return drivenToolsCount;
    }

    public void setDrivenToolsCount(String drivenToolsCount) {
        this.drivenToolsCount = drivenToolsCount;
    }

    @Basic
    @Column(name = "nonDrivenToolsCount", nullable = true, insertable = true, updatable = true, length = 255)
    public String getNonDrivenToolsCount() {
        return nonDrivenToolsCount;
    }

    public void setNonDrivenToolsCount(String nonDrivenToolsCount) {
        this.nonDrivenToolsCount = nonDrivenToolsCount;
    }

    @Basic
    @Column(name = "processingDiameterMm", nullable = true, insertable = true, updatable = true, length = 255)
    public String getProcessingDiameterMm() {
        return processingDiameterMm;
    }

    public void setProcessingDiameterMm(String processingDiameterMm) {
        this.processingDiameterMm = processingDiameterMm;
    }

    @Basic
    @Column(name = "processingDiameterInch", nullable = true, insertable = true, updatable = true, length = 255)
    public String getProcessingDiameterInch() {
        return processingDiameterInch;
    }

    public void setProcessingDiameterInch(String processingDiameterInch) {
        this.processingDiameterInch = processingDiameterInch;
    }

    @Basic
    @Column(name = "rodPassageDiameterMm", nullable = true, insertable = true, updatable = true, length = 255)
    public String getRodPassageDiameterMm() {
        return rodPassageDiameterMm;
    }

    public void setRodPassageDiameterMm(String rodPassageDiameterMm) {
        this.rodPassageDiameterMm = rodPassageDiameterMm;
    }

    @Basic
    @Column(name = "rodPassageDiameterInch", nullable = true, insertable = true, updatable = true, length = 255)
    public String getRodPassageDiameterInch() {
        return rodPassageDiameterInch;
    }

    public void setRodPassageDiameterInch(String rodPassageDiameterInch) {
        this.rodPassageDiameterInch = rodPassageDiameterInch;
    }

    @Basic
    @Column(name = "spindleHoleDiameterMm", nullable = true, insertable = true, updatable = true, length = 255)
    public String getSpindleHoleDiameterMm() {
        return spindleHoleDiameterMm;
    }

    public void setSpindleHoleDiameterMm(String spindleHoleDiameterMm) {
        this.spindleHoleDiameterMm = spindleHoleDiameterMm;
    }

    @Basic
    @Column(name = "spindleHoleDiameterInch", nullable = true, insertable = true, updatable = true, length = 255)
    public String getSpindleHoleDiameterInch() {
        return spindleHoleDiameterInch;
    }

    public void setSpindleHoleDiameterInch(String spindleHoleDiameterInch) {
        this.spindleHoleDiameterInch = spindleHoleDiameterInch;
    }

    @Basic
    @Column(name = "positionRepositionPrecisionMm", nullable = true, insertable = true, updatable = true, length = 255)
    public String getPositionRepositionPrecisionMm() {
        return positionRepositionPrecisionMm;
    }

    public void setPositionRepositionPrecisionMm(String positionRepositionPrecisionMm) {
        this.positionRepositionPrecisionMm = positionRepositionPrecisionMm;
    }

    @Basic
    @Column(name = "positionRepositionPrecisionInch", nullable = true, insertable = true, updatable = true, length = 255)
    public String getPositionRepositionPrecisionInch() {
        return positionRepositionPrecisionInch;
    }

    public void setPositionRepositionPrecisionInch(String positionRepositionPrecisionInch) {
        this.positionRepositionPrecisionInch = positionRepositionPrecisionInch;
    }

    @Basic
    @Column(name = "positionPrecision", nullable = true, insertable = true, updatable = true, length = 255)
    public String getPositionPrecision() {
        return positionPrecision;
    }

    public void setPositionPrecision(String positionPrecision) {
        this.positionPrecision = positionPrecision;
    }

    @Basic
    @Column(name = "spindleLife", nullable = true, insertable = true, updatable = true, length = 255)
    public String getSpindleLife() {
        return spindleLife;
    }

    public void setSpindleLife(String spindleLife) {
        this.spindleLife = spindleLife;
    }

    @Basic
    @Column(name = "machineLaunchingTime", nullable = true, insertable = true, updatable = true, length = 255)
    public String getMachineLaunchingTime() {
        return machineLaunchingTime;
    }

    public void setMachineLaunchingTime(String machineLaunchingTime) {
        this.machineLaunchingTime = machineLaunchingTime;
    }

    @Basic
    @Column(name = "photo2", nullable = true, insertable = true, updatable = true, length = 255)
    public String getPhoto2() {
        return photo2;
    }

    public void setPhoto2(String photo2) {
        this.photo2 = photo2;
    }

    @Basic
    @Column(name = "photo3", nullable = true, insertable = true, updatable = true, length = 255)
    public String getPhoto3() {
        return photo3;
    }

    public void setPhoto3(String photo3) {
        this.photo3 = photo3;
    }

    @Basic
    @Column(name = "photo4", nullable = true, insertable = true, updatable = true, length = 255)
    public String getPhoto4() {
        return photo4;
    }

    public void setPhoto4(String photo4) {
        this.photo4 = photo4;
    }

    @Basic
    @Column(name = "photo5", nullable = true, insertable = true, updatable = true, length = 255)
    public String getPhoto5() {
        return photo5;
    }

    public void setPhoto5(String photo5) {
        this.photo5 = photo5;
    }

    @Basic
    @Column(name = "video1", nullable = true, insertable = true, updatable = true, length = 255)
    public String getVideo1() {
        return video1;
    }

    public void setVideo1(String video1) {
        this.video1 = video1;
    }

    @Basic
    @Column(name = "video2", nullable = true, insertable = true, updatable = true, length = 255)
    public String getVideo2() {
        return video2;
    }

    public void setVideo2(String video2) {
        this.video2 = video2;
    }

    @Basic
    @Column(name = "video3", nullable = true, insertable = true, updatable = true, length = 255)
    public String getVideo3() {
        return video3;
    }

    public void setVideo3(String video3) {
        this.video3 = video3;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        LatheFullEntity that = (LatheFullEntity) o;

        if (counterSpindleRotationFreq != null ? !counterSpindleRotationFreq.equals(that.counterSpindleRotationFreq) : that.counterSpindleRotationFreq != null)
            return false;
        if (drivenToolsCount != null ? !drivenToolsCount.equals(that.drivenToolsCount) : that.drivenToolsCount != null)
            return false;
        if (fullSystemCnc != null ? !fullSystemCnc.equals(that.fullSystemCnc) : that.fullSystemCnc != null)
            return false;
        if (machineLaunchingTime != null ? !machineLaunchingTime.equals(that.machineLaunchingTime) : that.machineLaunchingTime != null)
            return false;
        if (nonDrivenToolsCount != null ? !nonDrivenToolsCount.equals(that.nonDrivenToolsCount) : that.nonDrivenToolsCount != null)
            return false;
        if (photo2 != null ? !photo2.equals(that.photo2) : that.photo2 != null) return false;
        if (photo3 != null ? !photo3.equals(that.photo3) : that.photo3 != null) return false;
        if (photo4 != null ? !photo4.equals(that.photo4) : that.photo4 != null) return false;
        if (photo5 != null ? !photo5.equals(that.photo5) : that.photo5 != null) return false;
        if (positionPrecision != null ? !positionPrecision.equals(that.positionPrecision) : that.positionPrecision != null)
            return false;
        if (positionRepositionPrecisionInch != null ? !positionRepositionPrecisionInch.equals(that.positionRepositionPrecisionInch) : that.positionRepositionPrecisionInch != null)
            return false;
        if (positionRepositionPrecisionMm != null ? !positionRepositionPrecisionMm.equals(that.positionRepositionPrecisionMm) : that.positionRepositionPrecisionMm != null)
            return false;
        if (processingDiameterInch != null ? !processingDiameterInch.equals(that.processingDiameterInch) : that.processingDiameterInch != null)
            return false;
        if (processingDiameterMm != null ? !processingDiameterMm.equals(that.processingDiameterMm) : that.processingDiameterMm != null)
            return false;
        if (productId != null ? !productId.equals(that.productId) : that.productId != null) return false;
        if (rodPassageDiameterInch != null ? !rodPassageDiameterInch.equals(that.rodPassageDiameterInch) : that.rodPassageDiameterInch != null)
            return false;
        if (rodPassageDiameterMm != null ? !rodPassageDiameterMm.equals(that.rodPassageDiameterMm) : that.rodPassageDiameterMm != null)
            return false;
        if (spindleHoleDiameterInch != null ? !spindleHoleDiameterInch.equals(that.spindleHoleDiameterInch) : that.spindleHoleDiameterInch != null)
            return false;
        if (spindleHoleDiameterMm != null ? !spindleHoleDiameterMm.equals(that.spindleHoleDiameterMm) : that.spindleHoleDiameterMm != null)
            return false;
        if (spindleLife != null ? !spindleLife.equals(that.spindleLife) : that.spindleLife != null) return false;
        if (spindlePower != null ? !spindlePower.equals(that.spindlePower) : that.spindlePower != null) return false;
        if (spindleRotationFreq != null ? !spindleRotationFreq.equals(that.spindleRotationFreq) : that.spindleRotationFreq != null)
            return false;
        if (video1 != null ? !video1.equals(that.video1) : that.video1 != null) return false;
        if (video2 != null ? !video2.equals(that.video2) : that.video2 != null) return false;
        if (video3 != null ? !video3.equals(that.video3) : that.video3 != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = productId != null ? productId.hashCode() : 0;
        result = 31 * result + (fullSystemCnc != null ? fullSystemCnc.hashCode() : 0);
        result = 31 * result + (spindleRotationFreq != null ? spindleRotationFreq.hashCode() : 0);
        result = 31 * result + (spindlePower != null ? spindlePower.hashCode() : 0);
        result = 31 * result + (counterSpindleRotationFreq != null ? counterSpindleRotationFreq.hashCode() : 0);
        result = 31 * result + (drivenToolsCount != null ? drivenToolsCount.hashCode() : 0);
        result = 31 * result + (nonDrivenToolsCount != null ? nonDrivenToolsCount.hashCode() : 0);
        result = 31 * result + (processingDiameterMm != null ? processingDiameterMm.hashCode() : 0);
        result = 31 * result + (processingDiameterInch != null ? processingDiameterInch.hashCode() : 0);
        result = 31 * result + (rodPassageDiameterMm != null ? rodPassageDiameterMm.hashCode() : 0);
        result = 31 * result + (rodPassageDiameterInch != null ? rodPassageDiameterInch.hashCode() : 0);
        result = 31 * result + (spindleHoleDiameterMm != null ? spindleHoleDiameterMm.hashCode() : 0);
        result = 31 * result + (spindleHoleDiameterInch != null ? spindleHoleDiameterInch.hashCode() : 0);
        result = 31 * result + (positionRepositionPrecisionMm != null ? positionRepositionPrecisionMm.hashCode() : 0);
        result = 31 * result + (positionRepositionPrecisionInch != null ? positionRepositionPrecisionInch.hashCode() : 0);
        result = 31 * result + (positionPrecision != null ? positionPrecision.hashCode() : 0);
        result = 31 * result + (spindleLife != null ? spindleLife.hashCode() : 0);
        result = 31 * result + (machineLaunchingTime != null ? machineLaunchingTime.hashCode() : 0);
        result = 31 * result + (photo2 != null ? photo2.hashCode() : 0);
        result = 31 * result + (photo3 != null ? photo3.hashCode() : 0);
        result = 31 * result + (photo4 != null ? photo4.hashCode() : 0);
        result = 31 * result + (photo5 != null ? photo5.hashCode() : 0);
        result = 31 * result + (video1 != null ? video1.hashCode() : 0);
        result = 31 * result + (video2 != null ? video2.hashCode() : 0);
        result = 31 * result + (video3 != null ? video3.hashCode() : 0);
        return result;
    }

}
