package com.springapp.mvc.dao.implementions;

import com.springapp.mvc.dao.interfaces.LatheDAO;
import com.springapp.mvc.domain.lathe.LatheFullEntity;
import com.springapp.mvc.domain.lathe.LatheLangFullEntity;
import com.springapp.mvc.domain.lathe.LatheLangShortEntity;
import com.springapp.mvc.domain.lathe.LatheShortEntity;
import org.apache.xmlbeans.impl.xb.xsdschema.RestrictionDocument;
import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class LatheDAOImpl implements LatheDAO {
    @Autowired
    private SessionFactory sessionFactory;

    @SuppressWarnings("unchecked")
    public void addLatheShort(LatheShortEntity latheShortEntity) {
        sessionFactory.getCurrentSession().saveOrUpdate(latheShortEntity);
    }

    @SuppressWarnings("unchecked")
    public void addLatheFull(LatheFullEntity latheFullEntity) {
        sessionFactory.getCurrentSession().saveOrUpdate(latheFullEntity);
    }

    @SuppressWarnings("unchecked")
    public void addLatheLangShort(LatheLangShortEntity latheLangShortEntity) {
        sessionFactory.getCurrentSession().saveOrUpdate(latheLangShortEntity);
    }

    @SuppressWarnings("unchecked")
    public void addLatheLangFull(LatheLangFullEntity latheLangFullEntity) {
        sessionFactory.getCurrentSession().saveOrUpdate(latheLangFullEntity);
    }

    @SuppressWarnings("unchecked")
    public List<LatheLangShortEntity> listLatheLangShort(String lang) {
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(LatheLangShortEntity.class);
        criteria.add(Restrictions.eq("latheLangShortEntityPK.language.lang",lang));
        return criteria.list();
    }

    @SuppressWarnings("unchecked")
    public List<LatheLangFullEntity> listLatheLangFull(String lang) {
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(LatheLangFullEntity.class);
        criteria.add(Restrictions.eq("latheLangFullEntityPK.language.lang",lang));
        return criteria.list();
    }

    @SuppressWarnings("unchecked")
    public void editLatheLangShort(LatheLangShortEntity lathe) {
        sessionFactory.getCurrentSession().update(lathe);
    }

    @SuppressWarnings("unchecked")
    public void editLatheLangFull(LatheLangFullEntity lathe) {
        sessionFactory.getCurrentSession().update(lathe);
    }
}
