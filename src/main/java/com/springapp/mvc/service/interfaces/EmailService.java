package com.springapp.mvc.service.interfaces;

import com.springapp.mvc.domain.MachineOrder;

public interface EmailService {
    public void sendNewOrderEmailToAdmin(MachineOrder machineOrder);
    public void sendNewOrderEmailToCustomer(String email, MachineOrder machineOrder);
}
