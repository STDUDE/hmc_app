package com.springapp.mvc.service.interfaces;

import com.springapp.mvc.domain.MachineOrder;

import java.util.List;

public interface MachineOrderService {
    public MachineOrder addMachineOrder(String firstName, String lastName, String company, String address, String postcode,
                                String email, String phone, String orderList, String total, String payment);
    public List<MachineOrder> listMachineOrder();
    public String getMachineOrderStatus(String orderId);
    public void setMachineOrderStatus(String orderId, String orderStatus);
}
