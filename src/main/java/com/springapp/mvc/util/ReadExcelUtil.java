package com.springapp.mvc.util;

import com.springapp.mvc.domain.common.LanguageEntity;
import com.springapp.mvc.domain.hmc.Hmc;
import com.springapp.mvc.domain.lathe.*;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.DataFormatter;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

public class ReadExcelUtil {

    private static Workbook getWorkbook(FileInputStream inputStream, String excelFilePath) throws IOException {
        Workbook workbook = null;
        if (excelFilePath.endsWith("xlsx")) {
            workbook = new XSSFWorkbook(inputStream);
        } else if (excelFilePath.endsWith("xls")) {
            workbook = new HSSFWorkbook(inputStream);
        }
        return workbook;
    }

    public static Hmc readMachine(File file) throws IOException{
        FileInputStream fis = new FileInputStream(file);
        Workbook workbook = getWorkbook(fis,file.getPath());
        Sheet firstSheet = workbook.getSheetAt(0);
        Iterator<Row> rowIterator = firstSheet.iterator();
        DataFormatter df = new DataFormatter();

        Hmc machine = new Hmc();
        machine.setProductId(df.formatCellValue(rowIterator.next().getCell(1)).trim());
        Row tmp = rowIterator.next();
        machine.setMachineTypeEn(df.formatCellValue(tmp.getCell(1)).trim());
        machine.setMachineTypeRu(df.formatCellValue(tmp.getCell(2)).trim());
        machine.setModel(df.formatCellValue(rowIterator.next().getCell(1)));
        machine.setBrand(df.formatCellValue(rowIterator.next().getCell(1)).trim());
        tmp = rowIterator.next();
        machine.setProducingCountryEn(df.formatCellValue(tmp.getCell(1)));
        machine.setProducingCountryRu(df.formatCellValue(tmp.getCell(2)));
        machine.setSystemCNC(df.formatCellValue(rowIterator.next().getCell(1)).trim());
        machine.setFullSystemCNC(df.formatCellValue(rowIterator.next().getCell(1)).trim());
        machine.setProductionYear((int) rowIterator.next().getCell(1).getNumericCellValue());
        tmp = rowIterator.next();
        machine.setMachineConditionEn(df.formatCellValue(tmp.getCell(1)));
        machine.setMachineConditionRu(df.formatCellValue(tmp.getCell(2)));
        tmp = rowIterator.next();
        machine.setMachineLocationEn(df.formatCellValue(tmp.getCell(1)).trim());
        machine.setMachineLocationRu(df.formatCellValue(tmp.getCell(2)).trim());
        machine.setAxisCount(df.formatCellValue(rowIterator.next().getCell(1)));
        machine.setxMotion((int)rowIterator.next().getCell(1).getNumericCellValue());
        machine.setyMotion((int)rowIterator.next().getCell(1).getNumericCellValue());
        machine.setzMotion((int)rowIterator.next().getCell(1).getNumericCellValue());
        machine.setxTableSize((int)rowIterator.next().getCell(1).getNumericCellValue());
        machine.setyTableSize((int)rowIterator.next().getCell(1).getNumericCellValue());
        machine.setTableLoad(df.formatCellValue(rowIterator.next().getCell(1)));
        machine.setSpindleTaper(df.formatCellValue(rowIterator.next().getCell(1)));
        machine.setSpindleRotationFreq(df.formatCellValue(rowIterator.next().getCell(1)));
        machine.setSpindlePower(df.formatCellValue(rowIterator.next().getCell(1)));
        machine.setToolCount(df.formatCellValue(rowIterator.next().getCell(1)));
        machine.setMaxToolDiameter(df.formatCellValue(rowIterator.next().getCell(1)));
        machine.setMaxToolWeight(df.formatCellValue(rowIterator.next().getCell(1)));
        machine.setMaxToolLength(df.formatCellValue(rowIterator.next().getCell(1)));
        machine.setToolReplacementTime(df.formatCellValue(rowIterator.next().getCell(1)));
        machine.setChipReplacementTime(df.formatCellValue(rowIterator.next().getCell(1)));
        machine.setPositionRepositionPrecision(df.formatCellValue(rowIterator.next().getCell(1)));
        machine.setSpindleRuntime(df.formatCellValue(rowIterator.next().getCell(1)));
        machine.setMachineLaunching(df.formatCellValue(rowIterator.next().getCell(1)));
        machine.setPrice((int)rowIterator.next().getCell(1).getNumericCellValue());
        machine.setPhoto1(df.formatCellValue(rowIterator.next().getCell(1)));
        machine.setPhoto2(df.formatCellValue(rowIterator.next().getCell(1)));
        machine.setPhoto3(df.formatCellValue(rowIterator.next().getCell(1)));
        machine.setPhoto4(df.formatCellValue(rowIterator.next().getCell(1)));
        machine.setPhoto5(df.formatCellValue(rowIterator.next().getCell(1)));
        tmp = rowIterator.next();
        machine.setDescriptionEn(df.formatCellValue(tmp.getCell(1)));
        machine.setDescriptionRu(df.formatCellValue(tmp.getCell(2)));
        machine.setVideo1(df.formatCellValue(rowIterator.next().getCell(1)));
        machine.setVideo2(df.formatCellValue(rowIterator.next().getCell(1)));
        machine.setVideo3(df.formatCellValue(rowIterator.next().getCell(1)));
        machine.setIsSold(df.formatCellValue(rowIterator.next().getCell(1)).trim());
        if(machine.getIsSold().equals("")) {
            machine.setIsSold("No");
        }
        fis.close();
        return machine;
    }

    public static Map<String,Object> readLathes(File uploadedFile, List<LanguageEntity> languages) throws IOException{
        int languagesNum = languages.size();
        Map<String,Object> map = new HashMap<String, Object>(4);

        LatheShortEntity latheShort = new LatheShortEntity();
        LatheFullEntity latheFull = new LatheFullEntity();
        LatheLangShortEntity[] latheLangShort = new LatheLangShortEntity[languagesNum];
        LatheLangFullEntity[] latheLangFull = new LatheLangFullEntity[languagesNum];
        LatheLangShortEntityPK[] latheLangShortPK = new LatheLangShortEntityPK[languagesNum];
        LatheLangFullEntityPK[] latheLangFullPK = new LatheLangFullEntityPK[languagesNum];

        for (int i = 0; i < languagesNum; i++) {
            latheLangShort[i] = new LatheLangShortEntity();
            latheLangShortPK[i] = new LatheLangShortEntityPK();
            latheLangShortPK[i].setLanguage(languages.get(i));
            latheLangFull[i] = new LatheLangFullEntity();
            latheLangFullPK[i] = new LatheLangFullEntityPK();
            latheLangFullPK[i].setLanguage(languages.get(i));
        }

        FileInputStream fis = new FileInputStream(uploadedFile);
        Workbook workbook = getWorkbook(fis, uploadedFile.getPath());
        Sheet firstSheet = workbook.getSheetAt(0);
        Iterator<Row> rowIterator = firstSheet.iterator();
        DataFormatter df = new DataFormatter();

        String productId = df.formatCellValue(rowIterator.next().getCell(1)).trim();
        latheShort.setProductId(productId);
        latheFull.setProductId(productId);
        latheShort.setModel(df.formatCellValue(rowIterator.next().getCell(1)).trim());

        for (int i = 0; i < 8; i++) {
            rowIterator.next();
        }

        Row row = rowIterator.next();
        for (int i = 0; i < languagesNum; i++) {
            latheLangShort[i].setMachineType(df.formatCellValue(row.getCell(1 + i)).trim());
        }
        row = rowIterator.next();
        for (int i = 0; i < languagesNum; i++) {
            latheLangShort[i].setProducingCountry(df.formatCellValue(row.getCell(1 + i)).trim());
        }
        row = rowIterator.next();
        for (int i = 0; i < languagesNum; i++) {
            latheLangShort[i].setMachineCondition(df.formatCellValue(row.getCell(1 + i)).trim());
        }
        row = rowIterator.next();
        for (int i = 0; i < languagesNum; i++) {
            latheLangShort[i].setMachineLocation(df.formatCellValue(row.getCell(1 + i)).trim());
        }
        row = rowIterator.next();
        for (int i = 0; i < languagesNum; i++) {
            latheLangFull[i].setCounterSpindlePresence(df.formatCellValue(row.getCell(1 + i)).trim());
        }
        row = rowIterator.next();
        for (int i = 0; i < languagesNum; i++) {
            latheLangFull[i].setTurretFasteningType(df.formatCellValue(row.getCell(1 + i)).trim());
        }
        row = rowIterator.next();
        for (int i = 0; i < languagesNum; i++) {
            latheLangFull[i].setTailstockPresence(df.formatCellValue(row.getCell(1 + i)).trim());
        }
        row = rowIterator.next();
        for (int i = 0; i < languagesNum; i++) {
            latheLangShort[i].setDescription(df.formatCellValue(row.getCell(1 + i)).trim());
        }

        rowIterator.next();
        rowIterator.next();

        row = rowIterator.next();
        latheShort.setMaxProcessingDiameterMm(Integer.valueOf(df.formatCellValue(row.getCell(1)).trim()));
        latheShort.setMaxProcessingDiameterInch((float) row.getCell(2).getNumericCellValue());
        row = rowIterator.next();
        latheShort.setMaxProcessingLengthMm(Integer.valueOf(df.formatCellValue(row.getCell(1)).trim()));
        latheShort.setMaxProcessingLengthInch((float) row.getCell(2).getNumericCellValue());
        row = rowIterator.next();
        latheShort.setxMotionMm(Integer.valueOf(df.formatCellValue(row.getCell(1)).trim()));
        latheShort.setxMotionInch((float) row.getCell(2).getNumericCellValue());
        row = rowIterator.next();
        latheShort.setyMotionMm(Integer.valueOf(df.formatCellValue(row.getCell(1)).trim()));
        latheShort.setyMotionInch((float) row.getCell(2).getNumericCellValue());
        row = rowIterator.next();
        latheShort.setzMotionMm(Integer.valueOf(df.formatCellValue(row.getCell(1)).trim()));
        latheShort.setzMotionInch((float) row.getCell(2).getNumericCellValue());
        row = rowIterator.next();
        latheFull.setProcessingDiameterMm(df.formatCellValue(row.getCell(1)).trim());
        latheFull.setProcessingDiameterInch(String.valueOf((float) row.getCell(2).getNumericCellValue()));
        row = rowIterator.next();
        latheFull.setRodPassageDiameterMm(df.formatCellValue(row.getCell(1)).trim());
        latheFull.setRodPassageDiameterInch(String.valueOf((float) row.getCell(2).getNumericCellValue()));
        row = rowIterator.next();
        latheFull.setSpindleHoleDiameterMm(df.formatCellValue(row.getCell(1)).trim());
        latheFull.setSpindleHoleDiameterInch(String.valueOf((float) row.getCell(2).getNumericCellValue()));
        row = rowIterator.next();
        String positionPrecisionMm = df.formatCellValue(row.getCell(1)).trim();
        float positionPrecisionInch = (float) row.getCell(2).getNumericCellValue();
        row = rowIterator.next();
        String repositionPrecisionMm = df.formatCellValue(row.getCell(1)).trim();
        float repositionPrecisionInch = (float) row.getCell(2).getNumericCellValue();
        latheFull.setPositionRepositionPrecisionMm(positionPrecisionMm.concat(" / ").concat(repositionPrecisionMm));
        latheFull.setPositionRepositionPrecisionInch(
                String.valueOf(positionPrecisionInch).concat(" / ").concat(String.valueOf(repositionPrecisionInch))
        );

        rowIterator.next();

        latheShort.setManufacturer(df.formatCellValue(rowIterator.next().getCell(1)).trim().toLowerCase());
        latheShort.setProductionYear((int) rowIterator.next().getCell(1).getNumericCellValue());
        latheShort.setSystemCNC(df.formatCellValue(rowIterator.next().getCell(1)).trim());
        latheFull.setFullSystemCnc(df.formatCellValue(rowIterator.next().getCell(1)).trim());
        latheFull.setSpindleRotationFreq(df.formatCellValue(rowIterator.next().getCell(1)).trim());
        latheFull.setSpindlePower(df.formatCellValue(rowIterator.next().getCell(1)).trim());
        latheFull.setCounterSpindleRotationFreq(df.formatCellValue(rowIterator.next().getCell(1)).trim());
        latheFull.setDrivenToolsCount(df.formatCellValue(rowIterator.next().getCell(1)).trim());
        latheFull.setNonDrivenToolsCount(df.formatCellValue(rowIterator.next().getCell(1)).trim());
        latheFull.setPositionPrecision(df.formatCellValue(rowIterator.next().getCell(1)).trim());
        latheFull.setSpindleLife(df.formatCellValue(rowIterator.next().getCell(1)).trim());
        latheFull.setMachineLaunchingTime(df.formatCellValue(rowIterator.next().getCell(1)).trim());

        rowIterator.next();

        latheShort.setPrice((int) rowIterator.next().getCell(1).getNumericCellValue());
        latheShort.setPhoto1(df.formatCellValue(rowIterator.next().getCell(1)).trim());
        latheFull.setPhoto2(df.formatCellValue(rowIterator.next().getCell(1)).trim());
        latheFull.setPhoto3(df.formatCellValue(rowIterator.next().getCell(1)).trim());
        latheFull.setPhoto4(df.formatCellValue(rowIterator.next().getCell(1)).trim());
        latheFull.setPhoto5(df.formatCellValue(rowIterator.next().getCell(1)).trim());
        latheFull.setVideo1(df.formatCellValue(rowIterator.next().getCell(1)).trim());
        latheFull.setVideo2(df.formatCellValue(rowIterator.next().getCell(1)).trim());
        latheFull.setVideo3(df.formatCellValue(rowIterator.next().getCell(1)).trim());

        latheShort.setIsSold("No");

        for (int i = 0; i < languagesNum; i++) {
            latheLangShortPK[i].setLatheShort(latheShort);
            latheLangFullPK[i].setLatheFull(latheFull);
            latheLangShort[i].setLatheLangShortEntityPK(latheLangShortPK[i]);
            latheLangFull[i].setLatheLangFullEntityPK(latheLangFullPK[i]);
        }

        map.put("latheShort", latheShort);
        map.put("latheFull", latheFull);
        map.put("latheLangShort", latheLangShort);
        map.put("latheLangFull", latheLangFull);

        fis.close();
        return map;
    }





}
