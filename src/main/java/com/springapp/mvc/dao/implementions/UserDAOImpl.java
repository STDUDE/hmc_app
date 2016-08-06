package com.springapp.mvc.dao.implementions;

import com.springapp.mvc.dao.interfaces.UserDAO;
import com.springapp.mvc.domain.User;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class UserDAOImpl implements UserDAO {

    @Autowired
    private SessionFactory sessionFactory;

    @SuppressWarnings("unchecked")
    public User getUserByUsername(String username){
        List<User> users = sessionFactory.getCurrentSession()
                .createQuery("from User where username=?").setParameter(0,username).list();
        if (users.size() > 0) {
            return users.get(0);
        }
        return null;
    }

    @SuppressWarnings("unchecked")
    public User createNewAccount(String username, String password, String email, String role) {
        User user = new User();
        user.setUsername(username);
        user.setUserPassword(password);
        user.setEmail(email);
        user.setRole(role);
        sessionFactory.getCurrentSession().save(user);
        return user;
    }

    @SuppressWarnings("unchecked")
    public List<User> listUsers() {
        return sessionFactory.getCurrentSession().createQuery("from User").list();
    }

    @SuppressWarnings("unchecked")
    public void setUserRole(String num, String role){
        sessionFactory.getCurrentSession().createQuery("update User set role=? where num=?")
                .setParameter(0,role).setParameter(1,Integer.parseInt(num)).executeUpdate();
    }

    @SuppressWarnings("unchecked")
    public List<String> listAdminEmails(){
        return sessionFactory.getCurrentSession().createQuery("select email from User where role='ROLE_ADMIN'").list();
    }

}
