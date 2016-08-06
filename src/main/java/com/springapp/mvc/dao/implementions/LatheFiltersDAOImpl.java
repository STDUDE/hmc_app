package com.springapp.mvc.dao.implementions;

import com.springapp.mvc.dao.interfaces.LatheFiltersDAO;
import com.springapp.mvc.domain.lathe.SlidersLatheFilterEntity;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.lang.reflect.InvocationTargetException;
import java.util.*;

@Repository
public class LatheFiltersDAOImpl implements LatheFiltersDAO {

    @Autowired
    private SessionFactory sessionFactory;

    public List<?> listFilter(Class<?> tClass) {
        return (List<?>)sessionFactory.getCurrentSession().createQuery("from " + tClass.getSimpleName()).list();
    }

    public void renewCheckboxFilter(Class clazz, String fieldName, String parentClassName) throws ClassNotFoundException, NoSuchMethodException, IllegalAccessException, InvocationTargetException, InstantiationException {
        deleteFrom(clazz.getSimpleName());
        List<String> list = listCheckboxFilter(fieldName, parentClassName);
        Set<String> set = getSet(list);
        for (String field : set) {
            Object object = getCheckboxObject(clazz, field, Collections.frequency(list, field));
            saveObject(object);
        }
    }

    @SuppressWarnings("unchecked")
    private void deleteFrom(String className) {
        sessionFactory.getCurrentSession().createQuery("delete from " + className).executeUpdate();
    }

    @SuppressWarnings("unchecked")
    private List<String> listCheckboxFilter(String fieldName, String parentClassName) {
        return sessionFactory.getCurrentSession().createQuery("select A." + fieldName + " from " + parentClassName + " A").list();
    }

    private Set<String> getSet(List<String> list) {
        Set<String> set = new HashSet<String>();
        for(String val : list) {
            set.add(val);
        }
        return set;
    }

    @SuppressWarnings("unchecked")
    private Object getCheckboxObject(Class clazz, String fieldParam, Integer numParam) throws IllegalAccessException, InvocationTargetException, InstantiationException, NoSuchMethodException, ClassNotFoundException {
        return clazz.getConstructor(String.class, Integer.class).newInstance(fieldParam, numParam);
    }

    @SuppressWarnings("unchecked")
    private void saveObject(Object object) {
        sessionFactory.getCurrentSession().save(object);
    }

    @SuppressWarnings("unchecked")
    public void renewSlidersFilter(Class clazz, LinkedHashMap<String,Integer> fieldInfo, String parentClassName) throws Exception {
        deleteFrom(clazz.getSimpleName());
        SlidersLatheFilterEntity slidersEntity = new SlidersLatheFilterEntity();
        for(Map.Entry<String,Integer> entry : fieldInfo.entrySet()) {
            List values = listFilterValues(entry.getKey(), parentClassName);
            if(values.get(0).getClass() == Float.class) {
                values = getIntegerListFromFloat(values);
            }
            int[] minMax = getIntegerMinMax(values);
            minMax = roundToNum(minMax, entry.getValue());
            setSlidersField(slidersEntity, entry.getKey(), minMaxToString(minMax));
        }
        saveObject(slidersEntity);
    }

    @SuppressWarnings("unchecked")
    private List listFilterValues(String fieldName, String parentClassName) {
        return sessionFactory.getCurrentSession().createQuery("select A." + fieldName + " from " + parentClassName + " A").list();
    }

    private int[] getIntegerMinMax(List<Integer> listParam) {
        int min = Integer.MAX_VALUE;
        int max = Integer.MIN_VALUE;
        for(Integer param : listParam) {
            min = Math.min(min, param);
            max = Math.max(max, param);
        }
        return new int[]{min,max};
    }

    private List<Integer> getIntegerListFromFloat(List<Float> listParam) {
        List<Integer> result = new ArrayList<Integer>();
        for(Float f : listParam) {
            result.add(f.intValue());
            if(f % 1 != 0) {
                result.add(f.intValue() + 1);
            }
        }
        return result;
    }

    private int[] roundToNum(int[] minMax, int num) {
        if(minMax[0] % num != 0) {
            minMax[0] -= minMax[0] % num;
        }
        if(minMax[1] % num != 0) {
            minMax[1] += (num - minMax[1] % num);
        }
        if(minMax[0] == minMax[1] && minMax[0] != 0) {
            minMax[0] -= num;
        }
        return minMax;
    }

    private String minMaxToString(int[] minMax) {
        return String.valueOf(minMax[0]).concat(",").concat(String.valueOf(minMax[1]));
    }

    private void setSlidersField(SlidersLatheFilterEntity slidersEntity, String field, String value) throws Exception {
        if("productionYear".equals(field))                  { slidersEntity.setProductionYear(value); }
        else if("price".equals(field))                      { slidersEntity.setPrice(value); }
        else if("xMotionMm".equals(field))                  { slidersEntity.setxMotionMm(value); }
        else if("yMotionMm".equals(field))                  { slidersEntity.setyMotionMm(value); }
        else if("zMotionMm".equals(field))                  { slidersEntity.setzMotionMm(value); }
        else if("maxProcessingDiameterMm".equals(field))    { slidersEntity.setMaxProcessingDiameterMm(value); }
        else if("maxProcessingLengthMm".equals(field))      { slidersEntity.setMaxProcessingLengthMm(value); }
        else if("xMotionInch".equals(field))                { slidersEntity.setxMotionInch(value); }
        else if("yMotionInch".equals(field))                { slidersEntity.setyMotionInch(value); }
        else if("zMotionInch".equals(field))                { slidersEntity.setzMotionInch(value); }
        else if("maxProcessingDiameterInch".equals(field))  { slidersEntity.setMaxProcessingDiameterInch(value); }
        else if("maxProcessingLengthInch".equals(field))    { slidersEntity.setMaxProcessingLengthInch(value); }
        else { throw new Exception("Illegal field in FiltersDAO"); }
    }
}
