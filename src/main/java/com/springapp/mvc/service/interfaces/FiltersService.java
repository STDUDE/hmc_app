package com.springapp.mvc.service.interfaces;

import com.springapp.mvc.domain.hmc.BrandFilter;
import com.springapp.mvc.domain.hmc.MachineLocationFilter;
import com.springapp.mvc.domain.hmc.SlidersFilter;
import com.springapp.mvc.domain.hmc.SystemCNCFilter;

import java.util.List;

public interface FiltersService {
    public List<BrandFilter> listBrandFilter();
    public List<MachineLocationFilter> listMachineLocationFilter();
    public List<SystemCNCFilter> listSystemCNCFilter();
    public List<SlidersFilter> listSlidersFilter();
    public void renewFilters();
}
