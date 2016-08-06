package com.springapp.mvc.service.implementions;

import com.springapp.mvc.dao.interfaces.FiltersDAO;
import com.springapp.mvc.domain.hmc.BrandFilter;
import com.springapp.mvc.domain.hmc.MachineLocationFilter;
import com.springapp.mvc.domain.hmc.SlidersFilter;
import com.springapp.mvc.domain.hmc.SystemCNCFilter;
import com.springapp.mvc.service.interfaces.FiltersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class FiltersServiceImpl implements FiltersService {
    @Autowired
    private FiltersDAO filtersDAO;

    @Transactional
    public List<BrandFilter> listBrandFilter() {
        return filtersDAO.listBrandFilter();
    }

    @Transactional
    public List<MachineLocationFilter> listMachineLocationFilter() {
        return filtersDAO.listMachineLocationFilter();
    }

    @Transactional
    public List<SystemCNCFilter> listSystemCNCFilter() {
        return filtersDAO.listSystemCNCFilter();
    }

    @Transactional
    public List<SlidersFilter> listSlidersFilter() {
        return filtersDAO.listSlidersFilter();
    }

    @Transactional
    public void renewFilters() {
        filtersDAO.renewBrandFilter();
        filtersDAO.renewMachineLocationFilter();
        filtersDAO.renewSystemCNCFilter();
        filtersDAO.renewSlidersFilter();
    }
}
