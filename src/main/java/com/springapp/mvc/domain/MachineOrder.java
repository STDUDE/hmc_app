package com.springapp.mvc.domain;

import javax.persistence.*;

@Entity
@Table(name="machine_order", schema = "", catalog = "hmc")
public class MachineOrder {
    @Id
    @Column(name = "orderId")
    private String orderId;

    @Column(name = "firstName")
    private String firstName;

    @Column(name = "lastName")
    private String lastName;

    @Column(name = "company")
    private String company;

    @Column(name = "address")
    private String address;

    @Column(name = "postcode")
    private String postcode;

    @Column(name = "email")
    private String email;

    @Column(name = "phone")
    private String phone;

    @Column(name = "orderList")
    private String orderList;

    @Column(name = "total")
    private String total;

    @Column(name = "payment")
    private String payment;

    @Column(name = "date")
    private String date;

    @Column(name = "orderStatus")
    private String orderStatus;

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String name) {
        this.firstName = name;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPostcode() {
        return postcode;
    }

    public void setPostcode(String postcode) {
        this.postcode = postcode;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getOrderList() {
        return orderList;
    }

    public void setOrderList(String order) {
        this.orderList = order;
    }

    public String getTotal() {
        return total;
    }

    public void setTotal(String total) {
        this.total = total;
    }

    public String getPayment() {
        return payment;
    }

    public void setPayment(String payment) {
        this.payment = payment;
    }

    public String getDate() {
        return date;
    }

    public void setDate (String date) {
        this.date = date;
    }

    public String getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(String orderStatus) {
        this.orderStatus = orderStatus;
    }
}
