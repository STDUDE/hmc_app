package com.springapp.mvc.dao.implementions;

import com.springapp.mvc.dao.interfaces.FiltersDAO;
import com.springapp.mvc.domain.hmc.MachineLocationFilter;
import com.springapp.mvc.domain.hmc.BrandFilter;
import com.springapp.mvc.domain.hmc.SlidersFilter;
import com.springapp.mvc.domain.hmc.SystemCNCFilter;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.*;

@Repository
public class FiltersDAOImpl implements FiltersDAO {

    @Autowired
    private SessionFactory sessionFactory;

    @SuppressWarnings("unchecked")
    public List<BrandFilter> listBrandFilter() {
        return sessionFactory.getCurrentSession().createQuery("from BrandFilter").list();
    }

    @SuppressWarnings("unchecked")
    public List<MachineLocationFilter> listMachineLocationFilter(){
        return sessionFactory.getCurrentSession().createQuery("from MachineLocationFilter").list();
    }

    @SuppressWarnings("unchecked")
    public List<SystemCNCFilter> listSystemCNCFilter(){
        return sessionFactory.getCurrentSession().createQuery("from SystemCNCFilter").list();
    }

    @SuppressWarnings("unchecked")
    public List<SlidersFilter> listSlidersFilter() {
        return sessionFactory.getCurrentSession().createQuery("from SlidersFilter").list();
    }

    @SuppressWarnings("unchecked")
    public void renewBrandFilter() {
        renew(BrandFilter.class.getSimpleName(), "brand");
    }

    @SuppressWarnings("unchecked")
    public void renewMachineLocationFilter() {
        renew(MachineLocationFilter.class.getSimpleName(), "machineLocationEn");
    }

    @SuppressWarnings("unchecked")
    public void renewSystemCNCFilter() {
        renew(SystemCNCFilter.class.getSimpleName(), "systemCNC");    }

    @SuppressWarnings("unchecked")
    private void renew(String className, String checkBoxName) {
        Session session = sessionFactory.getCurrentSession();
        session.createQuery("delete from " + className).executeUpdate();
        List<String> list = session.createQuery("select M." + checkBoxName + " from Hmc M").list();
        for (int i = 0; i < list.size(); i++) {
            list.set(i, list.get(i).toLowerCase());
        }
        Set<String> set = new HashSet<String>();
        for(String val : list) {
            set.add(val);
        }
        if(className.equals(BrandFilter.class.getSimpleName())) {
            for (String s : set) {
                session.save(getBrandFilter(s, Collections.frequency(list, s)));
            }
        } else if(className.equals(MachineLocationFilter.class.getSimpleName())) {
            for (String s : set) {
                session.save(getMachineLocationFilter(s, Collections.frequency(list, s)));
            }
        } else {
            for (String s : set) {
                session.save(getSystemCNCFilter(s, Collections.frequency(list, s)));
            }
        }
    }

    private BrandFilter getBrandFilter(String val, int num) {
        BrandFilter pf = new BrandFilter();
        pf.setBrand(val);
        pf.setNum(num);
        return pf;
    }

    private MachineLocationFilter getMachineLocationFilter(String val, int num) {
        MachineLocationFilter ml = new MachineLocationFilter();
        ml.setMachineLocation(val);
        ml.setNum(num);
        return ml;
    }

    private SystemCNCFilter getSystemCNCFilter(String val, int num) {
        SystemCNCFilter cnc = new SystemCNCFilter();
        cnc.setSystemCNC(val);
        cnc.setNum(num);
        return cnc;
    }

    @SuppressWarnings("unchecked")
    public void renewSlidersFilter() {
        Session session = sessionFactory.getCurrentSession();
        session.createQuery("delete from SlidersFilter").executeUpdate();
        List<Integer> listProductionYear = session.createQuery("select M.productionYear from Hmc M").list();
        List<Integer> listPrice = session.createQuery("select M.price from Hmc M").list();
        List<Integer> listXMotion = session.createQuery("select M.xMotion from Hmc M").list();
        List<Integer> listYMotion = session.createQuery("select M.yMotion from Hmc M").list();
        List<Integer> listZMotion = session.createQuery("select M.zMotion from Hmc M").list();
        List<Integer> listXTableSize = session.createQuery("select M.xTableSize from Hmc M").list();
        List<Integer> listYTableSize = session.createQuery("select M.yTableSize from Hmc M").list();
        int[] minMaxProductionYear = roundToNum(getMinMax(listProductionYear), 1);
        int[] minMaxPrice = roundToNum(getMinMax(listPrice), 500);
        int[] minMaxXMotion = roundToNum(getMinMax(listXMotion), 100);
        int[] minMaxYMotion = roundToNum(getMinMax(listYMotion), 100);
        int[] minMaxZMotion = roundToNum(getMinMax(listZMotion), 100);
        int[] minMaxXTableSize = roundToNum(getMinMax(listXTableSize), 100);
        int[] minMaxYTableSize = roundToNum(getMinMax(listYTableSize), 100);
        SlidersFilter sf = new SlidersFilter();
        sf.setId(1);
        sf.setProductionYear(getString(minMaxProductionYear));
        sf.setPrice(getString(minMaxPrice));
        sf.setxMotion(getString(minMaxXMotion));
        sf.setyMotion(getString(minMaxYMotion));
        sf.setzMotion(getString(minMaxZMotion));
        sf.setxTableSize(getString(minMaxXTableSize));
        sf.setyTableSize(getString(minMaxYTableSize));
        session.save(sf);
    }

    private int[] getMinMax(List<Integer> listParam) {
        int min = Integer.MAX_VALUE;
        int max = Integer.MIN_VALUE;
        for(Integer param : listParam) {
            min = Math.min(min, param);
            max = Math.max(max, param);
        }
        return new int[]{min,max};
    }

    private int[] roundToNum(int[] minMax, int num) {
        if(minMax[0] % num != 0) {
            minMax[0] -= minMax[0] % num;
        }
        if(minMax[1] % num != 0) {
            minMax[1] += (num - minMax[1] % num);
        }
        if(minMax[0] == minMax[1]) {
            minMax[0] -= num;
        }
        return minMax;
    }

    private String getString(int[] minMax) {
        return "" + minMax[0] + "," + minMax[1];
    }
}
