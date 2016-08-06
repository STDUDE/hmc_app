package com.springapp.mvc.service.implementions;

import com.springapp.mvc.dao.interfaces.UserDAO;
import com.springapp.mvc.domain.User;
import com.springapp.mvc.service.interfaces.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class UserServiceImpl implements UserService{

    @Autowired
    private UserDAO userDAO;

    @Transactional
    public User getUserByUsername(String username) throws UsernameNotFoundException {
        return userDAO.getUserByUsername(username);
    }

    @Transactional
    public User createNewAccount(String username, String password, String email, String role) {
        return userDAO.createNewAccount(username, password, email, role);
    }

    @Transactional
    public List<User> listUsers() {
        return userDAO.listUsers();
    }

    @Transactional
    public void setUserRole(String num, String role) {
        userDAO.setUserRole(num, role);
    }
}
