package com.springapp.mvc.service.interfaces;

import com.springapp.mvc.domain.hmc.Hmc;

import java.util.List;

public interface HmcService {
    public List<Hmc> listMachine();
    public List<String[]> listMachineForSiteMap();
    public Hmc getMachine(String productId);
    public List<Hmc> getMachinesList(String[] productIdArr);
    public List<Hmc> listFiltered(String brands, String yearRange, String priceRange, String locations,
                                      String cncs, String xMotionRange, String yMotionRange, String zMotionRange,
                                      String xTableRange, String yTableRange);
    public void editMachine(Hmc machine);
    public List<Hmc> randomListMachine();
    public List<Hmc> newArrivalsList();
}
