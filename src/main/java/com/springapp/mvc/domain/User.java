package com.springapp.mvc.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;

@Entity
@Table(name="users", schema = "", catalog = "hmc")
public class User implements Serializable{
    @Id
    @Column(name = "num")
    private int num;

    @Column(name = "username")
    private String username;

    @Column(name = "userPassword")
    private String userPassword;

    @Column(name = "email")
    private String email;

    @Column(name = "role")
    private String role;

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
}
