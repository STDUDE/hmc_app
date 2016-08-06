package com.springapp.mvc.service.interfaces;

import com.springapp.mvc.domain.lathe.LatheLangFullEntity;
import com.springapp.mvc.domain.lathe.LatheLangShortEntity;

import java.util.List;

public interface LatheService {
    public List<LatheLangShortEntity> listLatheLangShort(String lang);
    public List<LatheLangFullEntity> listLatheLangFull(String lang);
    public void editLatheLangShort(LatheLangShortEntity lathe);
    public void editLatheLangFull(LatheLangFullEntity lathe);
}
