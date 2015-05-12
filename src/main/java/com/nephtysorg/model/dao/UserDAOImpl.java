/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nephtysorg.model.dao;

import java.util.List;
import org.springframework.transaction.annotation.Transactional;
import com.nephtysorg.model.pojo.User;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

/**
 *
 * @author cfollet
 */
public class UserDAOImpl implements UserDAO {

    private SessionFactory sessionFactory;
 
    /**
     *
     * @param sessionFactory
     */
    public UserDAOImpl(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
    
    /**
     *
     * @param user
     */
    @Transactional
    @Override
    public void addUser(User user) {
        Session session = this.sessionFactory.getCurrentSession();
        session.persist(user);
    }

    /**
     *
     * @param user
     */
    @Transactional
    @Override
    public void updateUser(User user) {
        Session session = this.sessionFactory.getCurrentSession();
        session.merge(user);
    }

    /**
     *
     * @return
     */
    @Transactional
    @Override
    public List<User> listUsers() {
        Session session = this.sessionFactory.getCurrentSession();
        List<User> userList = session.createQuery("from User order by login").list();
        return userList;
    }

    /**
     *
     * @param id
     * @return
     */
    @Transactional
    @Override
    public User getUserById(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        User user = (User) session.load(User.class, new Integer(id));
        return user;
    }

    /**
     *
     * @param name
     * @return
     */
    @Transactional
    @Override
    public User getUserByName(String name) {
       Session session = this.sessionFactory.getCurrentSession();
        Query query = session.createQuery("from User where login = :login").setParameter("login", name);
        User result = (User) query.uniqueResult();
        return result;

    }

    /**
     *
     * @param id
     */
    @Transactional
    @Override
    public void removeUser(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        User user = (User) session.load(User.class, new Integer(id));
        if (null != user) {
                session.delete(user);
        }
    }

    /**
     *
     * @param user
     * @return
     */
    @Transactional
    @Override
    public boolean exist(User user) {
        Session session = this.sessionFactory.getCurrentSession();
        Query query = session.createQuery("from User where login = :login AND password = :password").setParameter("login", user.getLogin()).setParameter("password", user.getPassword());
        return query.uniqueResult() != null;
    }

}
