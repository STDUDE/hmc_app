package com.springapp.mvc.service.implementions;

import com.springapp.mvc.dao.interfaces.HmcDAO;
import com.springapp.mvc.domain.hmc.Hmc;
import com.springapp.mvc.service.interfaces.HmcService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
public class HmcServiceImpl implements HmcService {

    @Autowired
    private HmcDAO hmcDAO;

    @Transactional
    public List<Hmc> listMachine() {
        return hmcDAO.listMachine();
    }

    @Transactional
    public List<String[]> listMachineForSiteMap(){
        return hmcDAO.listMachineForSiteMap();
    }

    @Transactional
    public Hmc getMachine(String productId) {
        return hmcDAO.getMachine(productId);
    }

    @Transactional
    public List<Hmc> listFiltered(String brands, String yearRange, String priceRange,
                                      String locations, String cncs, String xMotionRange, String yMotionRange,
                                      String zMotionRange, String xTableSizeRange, String yTableSizeRange) {
        String[] brandArr = (brands != null) ? brands.split(",") : null;
        int[] yearRangeArr = (yearRange != null) ? getRangeArr(yearRange) : null;
        int[] priceRangeArr = (priceRange != null) ? getRangeArr(priceRange) : null;
        String[] locationArr = (locations != null) ? locations.split(",") : null;
        String[] cncArr = (cncs != null) ? cncs.split(",") : null;
        int[] xMotionRangeArr = (xMotionRange != null) ? getRangeArr(xMotionRange) : null;
        int[] yMotionRangeArr = (yMotionRange != null) ? getRangeArr(yMotionRange) : null;
        int[] zMotionRangeArr = (zMotionRange != null) ? getRangeArr(zMotionRange) : null;
        int[] xTableSizeRangeArr = (xTableSizeRange != null) ? getRangeArr(xTableSizeRange) : null;
        int[] yTableSizeRangeArr = (yTableSizeRange != null) ? getRangeArr(yTableSizeRange) : null;
        return hmcDAO.listFiltered(brandArr, yearRangeArr, priceRangeArr, locationArr,
                cncArr, xMotionRangeArr, yMotionRangeArr, zMotionRangeArr, xTableSizeRangeArr, yTableSizeRangeArr);
    }

    private int[] getRangeArr(String range) {
        return new int[]{Integer.valueOf(range.split(",")[0]), Integer.valueOf(range.split(",")[1])};
    }

    @Transactional
    public List<Hmc> getMachinesList(String[] productIdArr) {
        List<Hmc> list = new ArrayList<Hmc>();
        for (String productId : productIdArr) {
            list.add(hmcDAO.getMachine(productId));
        }
        return list;
    }

    @Transactional
    public void editMachine(Hmc machine) {
        hmcDAO.editMachine(machine);
    }

    @Transactional
    public List<Hmc> randomListMachine() {
        return hmcDAO.randomListMachine();
    }

    @Transactional
    public List<Hmc> newArrivalsList() {
        return hmcDAO.newArrivalsList();
    }

}