package com.springapp.mvc.service.interfaces;

import com.springapp.mvc.domain.User;

import java.util.List;

public interface UserService {
    public User getUserByUsername(String username);
    public User createNewAccount(String username, String password, String email, String role);
    public List<User> listUsers();
    public void setUserRole(String num, String role);
}
