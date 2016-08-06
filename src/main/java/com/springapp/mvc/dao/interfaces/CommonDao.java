package com.springapp.mvc.dao.interfaces;

import com.springapp.mvc.domain.common.LanguageEntity;

import java.util.List;

public interface CommonDao {
    public void addLanguage(LanguageEntity language);
    public List<LanguageEntity> listLanguage();
}
