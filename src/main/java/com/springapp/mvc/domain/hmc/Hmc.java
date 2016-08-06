    package com.springapp.mvc.domain.hmc;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name="machines", schema = "", catalog = "hmc")
public class Hmc implements Serializable{
    @Id
    @Column(name = "productId")
    private String productId;

    @Column(name = "machineTypeEn")
    private String machineTypeEn;

    @Column(name = "machineTypeRu")
    private String machineTypeRu;

    @Column(name = "model")
    private String model;

    @Column(name = "brand")
    private String brand;

    @Column(name = "producingCountryEn")
    private String producingCountryEn;

    @Column(name = "producingCountryRu")
    private String producingCountryRu;

    @Column(name = "systemCNC")
    private String systemCNC;

    @Column(name = "fullSystemCNC")
    private String fullSystemCNC;

    @Column(name = "productionYear")
    private int productionYear;

    @Column(name = "machineConditionEn")
    private String machineConditionEn;

    @Column(name = "machineConditionRu")
    private String machineConditionRu;

    @Column(name = "machineLocationEn")
    private String machineLocationEn;

    @Column(name = "machineLocationRu")
    private String machineLocationRu;

    @Column(name = "axisCount")
    private String axisCount;

    @Column(name = "xMotion")
    private int xMotion;

    @Column(name = "yMotion")
    private int yMotion;

    @Column(name = "zMotion")
    private int zMotion;

    @Column(name = "xTableSize")
    private int xTableSize;

    @Column(name = "yTableSize")
    private int yTableSize;

    @Column(name = "tableLoad")
    private String tableLoad;

    @Column(name = "spindleTaper")
    private String spindleTaper;

    @Column(name = "spindleRotationFreq")
    private String spindleRotationFreq;

    @Column(name = "spindlePower")
    private String spindlePower;

    @Column(name = "toolCount")
    private String toolCount;

    @Column(name = "maxToolDiameter")
    private String maxToolDiameter;

    @Column(name = "maxToolWeight")
    private String maxToolWeight;

    @Column(name = "maxToolLength")
    private String maxToolLength;

    @Column(name = "toolReplacementTime")
    private String toolReplacementTime;

    @Column(name = "chipReplacementTime")
    private String chipReplacementTime;

    @Column(name = "positionRepositionPrecision")
    private String positionRepositionPrecision;

    @Column(name = "spindleRuntime")
    private String spindleRuntime;

    @Column(name = "machineLaunching")
    private String machineLaunching;

    @Column(name = "price")
    private int price;

    @Column(name = "photo1")
    private String photo1;

    @Column(name = "photo2")
    private String photo2;

    @Column(name = "photo3")
    private String photo3;

    @Column(name = "photo4")
    private String photo4;

    @Column(name = "photo5")
    private String photo5;

    @Column(name = "descriptionEn")
    private String descriptionEn;

    @Column(name = "descriptionRu")
    private String descriptionRu;

    @Column(name = "video1")
    private String video1;

    @Column(name = "video2")
    private String video2;

    @Column(name = "video3")
    private String video3;

    @Column(name = "isSold")
    private String isSold;

    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

    public String getMachineTypeEn() {
        return machineTypeEn;
    }

    public void setMachineTypeEn(String machineTypeEn) {
        this.machineTypeEn = machineTypeEn;
    }

    public String getMachineTypeRu() {
        return machineTypeRu;
    }

    public void setMachineTypeRu(String machineTypeRu) {
        this.machineTypeRu = machineTypeRu;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getProducingCountryEn() {
        return producingCountryEn;
    }

    public void setProducingCountryEn(String producingCountryEn) {
        this.producingCountryEn = producingCountryEn;
    }

    public String getProducingCountryRu() {
        return producingCountryRu;
    }

    public void setProducingCountryRu(String producingCountryRu) {
        this.producingCountryRu = producingCountryRu;
    }

    public String getSystemCNC() {
        return systemCNC;
    }

    public void setSystemCNC(String systemCNC) {
        this.systemCNC = systemCNC;
    }

    public String getFullSystemCNC() {
        return fullSystemCNC;
    }

    public void setFullSystemCNC(String fullSystemCNC) {
        this.fullSystemCNC = fullSystemCNC;
    }

    public int getProductionYear() {
        return productionYear;
    }

    public void setProductionYear(int productionYear) {
        this.productionYear = productionYear;
    }

    public String getMachineConditionEn() {
        return machineConditionEn;
    }

    public void setMachineConditionEn(String machineCondition) {
        this.machineConditionEn = machineCondition;
    }

    public String getMachineConditionRu() {
        return machineConditionRu;
    }

    public void setMachineConditionRu(String machineConditionRu) {
        this.machineConditionRu = machineConditionRu;
    }

    public String getMachineLocationEn() {
        return machineLocationEn;
    }

    public void setMachineLocationEn(String machineLocation) {
        this.machineLocationEn = machineLocation;
    }

    public String getMachineLocationRu() {
        return machineLocationRu;
    }

    public void setMachineLocationRu(String machineLocationRu) {
        this.machineLocationRu = machineLocationRu;
    }

    public String getAxisCount() {
        return axisCount;
    }

    public void setAxisCount(String axisCount) {
        this.axisCount = axisCount;
    }

    public int getxMotion() {
        return xMotion;
    }

    public void setxMotion(int xMotion) {
        this.xMotion = xMotion;
    }

    public int getyMotion() {
        return yMotion;
    }

    public void setyMotion(int yMotion) {
        this.yMotion = yMotion;
    }

    public int getzMotion() {
        return zMotion;
    }

    public void setzMotion(int zMotion) {
        this.zMotion = zMotion;
    }

    public int getxTableSize() {
        return xTableSize;
    }

    public void setxTableSize(int xTableSize) {
        this.xTableSize = xTableSize;
    }

    public int getyTableSize() {
        return yTableSize;
    }

    public void setyTableSize(int yTableSize) {
        this.yTableSize = yTableSize;
    }

    public String getTableLoad() {
        return tableLoad;
    }

    public void setTableLoad(String tableLoad) {
        this.tableLoad = tableLoad;
    }

    public String getSpindleTaper() {
        return spindleTaper;
    }

    public void setSpindleTaper(String spindleTaper) {
        this.spindleTaper = spindleTaper;
    }

    public String getSpindleRotationFreq() {
        return spindleRotationFreq;
    }

    public void setSpindleRotationFreq(String spindleRotationFreq) {
        this.spindleRotationFreq = spindleRotationFreq;
    }

    public String getSpindlePower() {
        return spindlePower;
    }

    public void setSpindlePower(String spindlePower) {
        this.spindlePower = spindlePower;
    }

    public String getToolCount() {
        return toolCount;
    }

    public void setToolCount(String toolCount) {
        this.toolCount = toolCount;
    }

    public String getMaxToolDiameter() {
        return maxToolDiameter;
    }

    public void setMaxToolDiameter(String maxToolDiameter) {
        this.maxToolDiameter = maxToolDiameter;
    }

    public String getMaxToolWeight() {
        return maxToolWeight;
    }

    public void setMaxToolWeight(String maxToolWeight) {
        this.maxToolWeight = maxToolWeight;
    }

    public String getMaxToolLength() {
        return maxToolLength;
    }

    public void setMaxToolLength(String maxToolLength) {
        this.maxToolLength = maxToolLength;
    }

    public String getToolReplacementTime() {
        return toolReplacementTime;
    }

    public void setToolReplacementTime(String toolReplacementTime) {
        this.toolReplacementTime = toolReplacementTime;
    }

    public String getChipReplacementTime() {
        return chipReplacementTime;
    }

    public void setChipReplacementTime(String chipReplacementTime) {
        this.chipReplacementTime = chipReplacementTime;
    }

    public String getPositionRepositionPrecision() {
        return positionRepositionPrecision;
    }

    public void setPositionRepositionPrecision(String positionRepositionPrecision) {
        this.positionRepositionPrecision = positionRepositionPrecision;
    }

    public String getSpindleRuntime() {
        return spindleRuntime;
    }

    public void setSpindleRuntime(String spindleRuntime) {
        this.spindleRuntime = spindleRuntime;
    }

    public String getMachineLaunching() {
        return machineLaunching;
    }

    public void setMachineLaunching(String machineLaunching) {
        this.machineLaunching = machineLaunching;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getPhoto1() {
        return photo1;
    }

    public void setPhoto1(String photo1) {
        this.photo1 = photo1;
    }

    public String getPhoto2() {
        return photo2;
    }

    public void setPhoto2(String photo2) {
        this.photo2 = photo2;
    }

    public String getPhoto3() {
        return photo3;
    }

    public void setPhoto3(String photo3) {
        this.photo3 = photo3;
    }

    public String getPhoto4() {
        return photo4;
    }

    public void setPhoto4(String photo4) {
        this.photo4 = photo4;
    }

    public String getPhoto5() {
        return photo5;
    }

    public void setPhoto5(String photo5) {
        this.photo5 = photo5;
    }

    public String getDescriptionEn() {
        return descriptionEn;
    }

    public void setDescriptionEn(String descriptionEn) {
        this.descriptionEn = descriptionEn;
    }

    public String getDescriptionRu() {
        return descriptionRu;
    }

    public void setDescriptionRu(String descriptionRu) {
        this.descriptionRu = descriptionRu;
    }

    public String getVideo1() {
        return video1;
    }

    public void setVideo1(String video1) {
        this.video1 = video1;
    }

    public String getVideo2() {
        return video2;
    }

    public void setVideo2(String video2) {
        this.video2 = video2;
    }

    public String getVideo3() {
        return video3;
    }

    public void setVideo3(String video3) {
        this.video3 = video3;
    }

    public String getIsSold() {
        return isSold;
    }

    public void setIsSold(String isSold) {
        this.isSold = isSold;
    }

}
