package com.springapp.mvc.service.interfaces;

import com.springapp.mvc.domain.lathe.BrandLatheFilterEntity;
import com.springapp.mvc.domain.lathe.MachineLocationLatheFilterEntity;
import com.springapp.mvc.domain.lathe.SlidersLatheFilterEntity;
import com.springapp.mvc.domain.lathe.SystemCncLatheFilterEntity;

import java.util.List;

public interface LatheFiltersService {
    public List<BrandLatheFilterEntity> listBrandLatheFilter();
    public List<SystemCncLatheFilterEntity> listSystemCncLatheFilter();
    public List<MachineLocationLatheFilterEntity> listMachineLocationLatheFilter();
    public SlidersLatheFilterEntity getSlidersLatheFilter();
    public List<SlidersLatheFilterEntity> listSlidersLatheFilter();
    public void renewFilters();
}
