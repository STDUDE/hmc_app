package com.springapp.mvc.service.implementions;

import com.springapp.mvc.dao.interfaces.LatheDAO;
import com.springapp.mvc.domain.lathe.LatheLangFullEntity;
import com.springapp.mvc.domain.lathe.LatheLangShortEntity;
import com.springapp.mvc.service.interfaces.LatheService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class LatheServiceImpl implements LatheService {

    @Autowired
    private LatheDAO latheDAO;

    @Transactional
    public List<LatheLangShortEntity> listLatheLangShort(String lang) {
        return latheDAO.listLatheLangShort(lang);
    }

    @Transactional
    public List<LatheLangFullEntity> listLatheLangFull(String lang) {
        return latheDAO.listLatheLangFull(lang);
    }

    @Transactional
    public void editLatheLangShort(LatheLangShortEntity lathe) {
        latheDAO.editLatheLangShort(lathe);
    }

    @Transactional
    public void editLatheLangFull(LatheLangFullEntity lathe) {
        latheDAO.editLatheLangFull(lathe);
    }

}