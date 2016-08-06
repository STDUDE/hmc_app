package com.springapp.mvc.dao.interfaces;

import com.springapp.mvc.domain.hmc.Hmc;

import java.util.List;

public interface HmcDAO {
    public List<Hmc> listMachine();
    public List<String[]> listMachineForSiteMap();
    public Hmc getMachine(String productId);
    public void addMachine(Hmc machine);
    public List<Hmc> listFiltered(String[] brandArr, int[] yearRangeArr, int[] priceRangeArr,
        String[] locationArr, String[] cncArr, int[] xMotionRangeArr, int[] yMotionRangeArr,
        int[] zMotionRangeArr,int[] xTableRangeArr, int[] yTableRangeArr);
    public void editMachine(Hmc machine);
    public List<Hmc> randomListMachine();
    public List<Hmc> newArrivalsList();
}
