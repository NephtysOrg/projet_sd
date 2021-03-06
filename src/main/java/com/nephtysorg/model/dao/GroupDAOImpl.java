/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nephtysorg.model.dao;

import java.util.List;
import com.nephtysorg.model.pojo.Group;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author cfollet
 */
public class GroupDAOImpl implements GroupDAO {
    
   private SessionFactory sessionFactory;
 
    /**
     *
     * @param sessionFactory
     */
    public GroupDAOImpl(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    /**
     *
     * @param group
     */
    @Transactional
    @Override
    public void addGroup(Group group) {
        Session session = this.sessionFactory.getCurrentSession();
        session.persist(group);
    }

    /**
     *
     * @param group
     */
    @Transactional
    @Override
    public void updateGroup(Group group) {
        Session session = this.sessionFactory.getCurrentSession();
            session.merge(group);

    }

    /**
     *
     * @return
     */
    @Transactional
    @Override
    public List<Group> listGroups() {
        Session session = this.sessionFactory.getCurrentSession();
        List<Group> groupList = session.createQuery("from Group").list();
        return groupList;
    }

    /**
     *
     * @param id
     * @return
     */
    @Transactional
    @Override
    public Group getGroupById(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        Group group = (Group) session.load(Group.class, new Integer(id));
       
        return (Group) group;
    }

    /**
     *
     * @param name
     * @return
     */
    @Transactional
    @Override
    public Group getGroupByName(String name) {
        Session session = this.sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Group where name = :name").setParameter("name", name);
        
        return (Group) query.uniqueResult();
    }

    /**
     *
     * @param id
     */
    @Transactional
    @Override
    public void removeGroup(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        Group group = (Group) session.load(Group.class, new Integer(id));
        session.delete(group);
    }

    /**
     *
     * @param group
     * @return
     */
    @Transactional
    @Override
    public boolean exist(Group group) {
        return this.getGroupByName(group.getName()) != null;
    }

}
