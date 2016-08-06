package com.springapp.mvc.dao.implementions;

import com.springapp.mvc.dao.interfaces.CommonDao;
import com.springapp.mvc.dao.interfaces.LatheDAO;
import com.springapp.mvc.domain.common.LanguageEntity;
import com.springapp.mvc.domain.lathe.LatheLangFullEntity;
import com.springapp.mvc.domain.lathe.LatheLangShortEntity;
import com.springapp.mvc.domain.lathe.LatheShortEntity;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CommonDAOImpl implements CommonDao {
    @Autowired
    private SessionFactory sessionFactory;

    @SuppressWarnings("unchecked")
    public void addLanguage(LanguageEntity language) {
        sessionFactory.getCurrentSession().save(language);
    }

    @SuppressWarnings("unchecked")
    public List<LanguageEntity> listLanguage() {
        return sessionFactory.getCurrentSession().getNamedQuery("listLanguage").list();
    }

}