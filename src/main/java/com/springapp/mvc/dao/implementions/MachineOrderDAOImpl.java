package com.springapp.mvc.dao.implementions;

import com.springapp.mvc.dao.interfaces.MachineOrderDAO;
import com.springapp.mvc.domain.MachineOrder;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class MachineOrderDAOImpl implements MachineOrderDAO {
    @Autowired
    private SessionFactory sessionFactory;

    @SuppressWarnings("unchecked")
    public List<MachineOrder> listMachineOrder() {
        return sessionFactory.getCurrentSession().createQuery("from MachineOrder").list();
    }

    @SuppressWarnings("unchecked")
    public void addMachineOrder(MachineOrder machineOrder) {
        sessionFactory.getCurrentSession().saveOrUpdate(machineOrder);
    }

    @SuppressWarnings("unchecked")
    public String getMachineOrderStatus(String orderId) {
        Query query = sessionFactory.getCurrentSession().createQuery("from MachineOrder where orderId=?").setParameter(0,orderId);
        MachineOrder machineOrder = (MachineOrder) query.uniqueResult();
        return machineOrder.getOrderStatus();
    }

    @SuppressWarnings("unchecked")
    public void setMachineOrderStatus(String orderId, String orderStatus) {
        sessionFactory.getCurrentSession().createQuery(
                "update MachineOrder set orderStatus='" + orderStatus + "' where orderId='" + orderId + "'"
        ).executeUpdate();
    }

}