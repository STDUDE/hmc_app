package com.springapp.mvc.service.implementions;

import com.springapp.mvc.dao.interfaces.LatheFiltersDAO;
import com.springapp.mvc.domain.lathe.*;
import com.springapp.mvc.service.interfaces.LatheFiltersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.LinkedHashMap;
import java.util.List;

@Service
public class LatheFiltersServiceImpl implements LatheFiltersService {
    @Autowired
    private LatheFiltersDAO latheFiltersDAO;

    @Transactional
    @SuppressWarnings("unchecked")
    public List<BrandLatheFilterEntity> listBrandLatheFilter() {
        return (List<BrandLatheFilterEntity>)latheFiltersDAO.listFilter(BrandLatheFilterEntity.class);
    }

    @Transactional
    @SuppressWarnings("unchecked")
    public List<SystemCncLatheFilterEntity> listSystemCncLatheFilter() {
        return (List<SystemCncLatheFilterEntity>)latheFiltersDAO.listFilter(SystemCncLatheFilterEntity.class);
    }

    @Transactional
    @SuppressWarnings("unchecked")
    public List<MachineLocationLatheFilterEntity> listMachineLocationLatheFilter() {
        return (List<MachineLocationLatheFilterEntity>)latheFiltersDAO.listFilter(MachineLocationLatheFilterEntity.class);
    }

    @Transactional
    @SuppressWarnings("unchecked")
    public SlidersLatheFilterEntity getSlidersLatheFilter() {
        return (SlidersLatheFilterEntity)latheFiltersDAO.listFilter(SlidersLatheFilterEntity.class).get(0);
    }

    @Transactional
    @SuppressWarnings("unchecked")
    public List<SlidersLatheFilterEntity> listSlidersLatheFilter() {
        return (List<SlidersLatheFilterEntity>)latheFiltersDAO.listFilter(SlidersLatheFilterEntity.class);
    }

    @Transactional
    public void renewFilters() {
        try {
            latheFiltersDAO.renewCheckboxFilter(BrandLatheFilterEntity.class, "manufacturer", LatheShortEntity.class.getSimpleName());
            latheFiltersDAO.renewCheckboxFilter(MachineLocationLatheFilterEntity.class, "machineLocation", LatheLangShortEntity.class.getSimpleName());
            latheFiltersDAO.renewCheckboxFilter(SystemCncLatheFilterEntity.class, "systemCNC", LatheShortEntity.class.getSimpleName());
            LinkedHashMap<String,Integer> fieldInfo = new LinkedHashMap<String, Integer>(){{
                put("productionYear",1);
                put("price",500);
                put("xMotionMm",100); put("xMotionInch",10);
                put("yMotionMm",100); put("yMotionInch",10);
                put("zMotionMm",100); put("zMotionInch",10);
                put("maxProcessingDiameterMm",100); put("maxProcessingDiameterInch",10);
                put("maxProcessingLengthMm",100); put("maxProcessingLengthInch",10);
            }};
            latheFiltersDAO.renewSlidersFilter(SlidersLatheFilterEntity.class, fieldInfo, LatheShortEntity.class.getSimpleName());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
