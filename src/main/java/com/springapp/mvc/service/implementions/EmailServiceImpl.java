package com.springapp.mvc.service.implementions;

import com.springapp.mvc.dao.interfaces.UserDAO;
import com.springapp.mvc.domain.MachineOrder;
import com.springapp.mvc.service.interfaces.EmailService;
import com.springapp.mvc.util.EmailUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class EmailServiceImpl implements EmailService {

    @Autowired
    private EmailUtil emailUtil;

    @Autowired
    private UserDAO userDAO;

    private final String WEBSITE_EMAIL = "contact@hmccnc.com";

    @Transactional
    public void sendNewOrderEmailToAdmin(MachineOrder machineOrder) {
        List<String> adminEmails = userDAO.listAdminEmails();
        for(String email : adminEmails) {
            Map<String, Object> model = new HashMap<String, Object>();
            model.put("from", WEBSITE_EMAIL);
            model.put("subject", "HMC. New order: " + machineOrder.getOrderId());
            model.put("to", email);
            model.put("bccList", new ArrayList<String>());
            machineOrder.setOrderList(machineOrder.getOrderList().replace("\n", "<br>"));
            model.put("machineOrder", machineOrder);
            emailUtil.sendEmail("machine-order-admin.vm", model);
        }
    }

    @Transactional
    public void sendNewOrderEmailToCustomer(String email, MachineOrder machineOrder) {
        Map<String, Object> model = new HashMap<String, Object>();
        model.put("from", WEBSITE_EMAIL);
        model.put("subject", "Thanks for ordering!");
        model.put("to", email);
        model.put("bccList", new ArrayList<String>());
        machineOrder.setOrderList(machineOrder.getOrderList().replace("\n", "<br>"));
        model.put("machineOrder", machineOrder);
        emailUtil.sendEmail("machine-order-customer.vm", model);
    }

}
