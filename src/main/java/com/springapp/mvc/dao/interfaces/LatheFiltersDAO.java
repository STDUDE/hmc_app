package com.springapp.mvc.dao.interfaces;

import java.lang.reflect.InvocationTargetException;
import java.util.LinkedHashMap;
import java.util.List;

public interface LatheFiltersDAO {
    public List<?> listFilter(Class<?> tClass);
    public void renewCheckboxFilter(Class clazz, String fieldName, String parentClassName) throws ClassNotFoundException, NoSuchMethodException, IllegalAccessException, InvocationTargetException, InstantiationException;
    public void renewSlidersFilter(Class clazz, LinkedHashMap<String,Integer> fieldInfo, String parentClassName) throws Exception;
}
