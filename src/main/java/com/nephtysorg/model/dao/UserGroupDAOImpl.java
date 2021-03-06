/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nephtysorg.model.dao;

import java.util.List;
import org.springframework.transaction.annotation.Transactional;
import com.nephtysorg.model.pojo.UserGroup;
import com.nephtysorg.model.pojo.UserGroupId;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;

/**
 *
 * @author cfollet
 */
public class UserGroupDAOImpl implements UserGroupDAO {
    private SessionFactory sessionFactory;
    
    /**
     *
     * @param sessionFactory
     */
    public UserGroupDAOImpl(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
        
    /**
     *
     * @param userGroup
     */
    @Transactional
    @Override
    public void addUserGroup(UserGroup userGroup) {
        Session session = this.sessionFactory.getCurrentSession();
            session.saveOrUpdate(userGroup);
    }

    /**
     *
     * @param userGroup
     */
    @Transactional
    @Override
    public void updateUserGroup(UserGroup userGroup) {
        Session session = this.sessionFactory.getCurrentSession();
            session.update(userGroup);
    }

    /**
     *
     * @return
     */
    @Transactional
    @Override
    public List<UserGroup> listUserGroups() {
        Session session = this.sessionFactory.getCurrentSession();
        List<UserGroup> userGroupList = session.createQuery("from UserGroup order by member_since desc").list();
        return userGroupList;
    }

    /**
     *
     * @param id
     * @return
     */
    @Transactional
    @Override
    public UserGroup getUserGroupById(UserGroupId id) {
        Session session = this.sessionFactory.getCurrentSession();
        UserGroup user = (UserGroup) session.get(UserGroup.class, id);
        
        return user;
    }

    /**
     *
     * @param id
     */
    @Transactional
    @Override
    public void removeUserGroup(UserGroupId id) {
        Session session = this.sessionFactory.getCurrentSession();
        UserGroup userGroup = (UserGroup) session.load(UserGroup.class, id);
        if (null != userGroup) {
                session.delete(userGroup);
        }
    }

}
