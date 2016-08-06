package com.springapp.mvc.service.implementions;

import com.springapp.mvc.dao.interfaces.MachineOrderDAO;
import com.springapp.mvc.domain.MachineOrder;
import com.springapp.mvc.service.interfaces.MachineOrderService;
import com.springapp.mvc.util.EmailUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Service
public class MachineOrderServiceImpl implements MachineOrderService {
    @Autowired
    private MachineOrderDAO machineOrderDAO;

    @Autowired
    EmailUtil emailUtil;

    @Transactional
    public MachineOrder addMachineOrder(String firstName, String lastName, String company, String address, String postcode,
                                String email, String phone, String orderList, String total, String payment) {
        MachineOrder machineOrder = new MachineOrder();
        String orderId = UUID.randomUUID().randomUUID().toString();
        machineOrder.setOrderId(orderId);
        machineOrder.setFirstName(firstName);
        machineOrder.setLastName(lastName);
        machineOrder.setCompany(company);
        machineOrder.setAddress(address);
        machineOrder.setPostcode(postcode);
        machineOrder.setEmail(email);
        machineOrder.setPhone(phone);
        machineOrder.setOrderList(cutOrderList(orderList));
        machineOrder.setTotal(total);
        machineOrder.setPayment(payment);
        DateFormat dateFormat = new SimpleDateFormat("dd.MM.yyyy");
        machineOrder.setDate(dateFormat.format(new Date()));
        machineOrder.setOrderStatus("The order is accepted.");
        machineOrderDAO.addMachineOrder(machineOrder);
        return machineOrder;
    }

    @Transactional
    public List<MachineOrder> listMachineOrder() {
        return machineOrderDAO.listMachineOrder();
    }

    private String cutOrderList(String orderList) {
        String[] array = orderList.split(";");
        StringBuilder newOrderList = new StringBuilder();
        for(String s : array) {
            String[] arrS = s.split(",");
            newOrderList.append(arrS[0]).append(",").append(arrS[4]).append(",").append(arrS[1]).append(",").append(arrS[2]).append("\n");
        }
        return newOrderList.toString();
    }

    @Transactional
    public String getMachineOrderStatus(String orderId) {
        return machineOrderDAO.getMachineOrderStatus(orderId);
    }

    @Transactional
    public void setMachineOrderStatus(String orderId, String orderStatus) {
        machineOrderDAO.setMachineOrderStatus(orderId, orderStatus);
    }
}
