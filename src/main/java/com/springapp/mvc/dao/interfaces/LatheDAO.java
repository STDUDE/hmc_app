package com.springapp.mvc.dao.interfaces;

import com.springapp.mvc.domain.lathe.LatheFullEntity;
import com.springapp.mvc.domain.lathe.LatheLangFullEntity;
import com.springapp.mvc.domain.lathe.LatheLangShortEntity;
import com.springapp.mvc.domain.lathe.LatheShortEntity;

import java.util.List;

public interface LatheDAO {
    public void addLatheShort(LatheShortEntity latheShortEntity);
    public void addLatheFull(LatheFullEntity latheFullEntity);
    public void addLatheLangShort(LatheLangShortEntity latheLangShortEntity);
    public void addLatheLangFull(LatheLangFullEntity latheLangFullEntity);
    public List<LatheLangShortEntity> listLatheLangShort(String lang);
    public List<LatheLangFullEntity> listLatheLangFull(String lang);
    public void editLatheLangShort(LatheLangShortEntity lathe);
    public void editLatheLangFull(LatheLangFullEntity lathe);
}
