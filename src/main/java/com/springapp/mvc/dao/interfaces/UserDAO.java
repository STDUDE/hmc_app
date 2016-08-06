package com.springapp.mvc.dao.interfaces;

import com.springapp.mvc.domain.User;

import java.util.List;

public interface UserDAO {
    public User getUserByUsername(String username);
    public User createNewAccount(String username, String password, String email, String role);
    public List<User> listUsers();
    public void setUserRole(String num, String role);
    public List<String> listAdminEmails();
}
