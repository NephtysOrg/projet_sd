/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nephtysorg.model.service;

import com.nephtysorg.model.dao.GroupDAO;
import java.util.List;
import com.nephtysorg.model.dao.UserGroupDAO;
import com.nephtysorg.model.pojo.Group;
import com.nephtysorg.model.pojo.User;
import com.nephtysorg.model.pojo.UserGroup;
import com.nephtysorg.model.pojo.UserGroupId;
import java.util.Date;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author cfollet
 */
@Service
public class GroupServiceImpl implements GroupService {
    
    @Autowired
    private GroupDAO groupDAO;
    
    @Autowired
    private UserGroupDAO userGroupDAO;
     
    /**
     *
     * @param group
     */
    @Override
    @Transactional
    public void addGroup(Group group) {
        groupDAO.addGroup(group);
        
        // Add the owner of the group in the UserGroup table we need
        // to to it manually because UserGroup is not only  a pivot table
        // see pojo class
        UserGroup ug = new UserGroup();
        ug.setId(new UserGroupId(group.getUser().getId(), group.getId()));
        ug.setGroup(group);
        ug.setUser(group.getUser());
        ug.setInvited((byte) 0);       // false
        ug.setSubscribed((byte) 0);    // false
        userGroupDAO.addUserGroup(ug);
    }

    /**
     *
     * @param group
     */
    @Override
    @Transactional
    public void updateGroup(Group group) {
        groupDAO.updateGroup(group);
    }

    /**
     *
     * @return
     */
    @Override
    @Transactional
    public List<Group> listGroups() {
        return groupDAO.listGroups();
    }

    /**
     *
     * @param id
     * @return
     */
    @Override
    @Transactional
    public Group getGroupById(int id) {
        return groupDAO.getGroupById(id);
    }

    /**
     *
     * @param name
     * @return
     */
    @Override
    @Transactional
    public Group getGroupByName(String name) {
        return groupDAO.getGroupByName(name);
    }

    /**
     *
     * @param id
     */
    @Override
    @Transactional
    public void removeGroup(int id) {
        groupDAO.removeGroup(id);
    }

    /**
     *
     * @param group
     * @return
     */
    @Override
    @Transactional
    public boolean exist(Group group) {
        return groupDAO.exist(group);
    }

    /**
     *
     * @param user
     * @param group
     */
    @Override
    @Transactional
    public void invite(User user, Group group) {
        UserGroupId id = new UserGroupId(user.getId(), group.getId());
        UserGroup ug = this.userGroupDAO.getUserGroupById(id);
        
        // Une lisaison existe deja
        if(ug != null){
            // Elle est de type different
            if(ug.getSubscribed() == (byte) 1 ){
               this.accept(user, group);
            }
        }else{
            // Aucune liaison n'existe
            ug = new UserGroup();
            ug.setId(new UserGroupId(user.getId(), group.getId()));
            ug.setGroup(group);
            ug.setUser(group.getUser());
            ug.setInvited((byte) 1);       // false
            ug.setSubscribed((byte) 0);    // true
            userGroupDAO.addUserGroup(ug);
            }
        
    }

    /**
     *
     * @param user
     * @param group
     */
    @Override
    @Transactional
    public void accept(User user, Group group) {
        UserGroupId id = new UserGroupId(user.getId(), group.getId());
        UserGroup ug = this.userGroupDAO.getUserGroupById(id);
        ug.setSubscribed((byte)0);
        ug.setInvited((byte)0);
        ug.setMember_since(new Date());
        this.userGroupDAO.updateUserGroup(ug);
    }

    /**
     *
     * @param user
     * @param group
     */
    @Override
    @Transactional
    public void subscribe(User user, Group group) {
        UserGroupId id = new UserGroupId(user.getId(), group.getId());
        UserGroup ug = this.userGroupDAO.getUserGroupById(id);
        
        // Une lisaison existe deja
        if(ug != null){
            // Elle est de type different
            if(ug.getInvited() == (byte) 1 ){
               this.accept(user, group);
            }
        }else{
            // Aucune liaison n'existe
            ug = new UserGroup();
            ug.setId(new UserGroupId(user.getId(), group.getId()));
            ug.setGroup(group);
            ug.setUser(group.getUser());
            ug.setInvited((byte) 0);       // false
            ug.setSubscribed((byte) 1);    // true
            userGroupDAO.addUserGroup(ug);
            }
    }

    /**
     *
     * @param user
     * @param group
     */
    @Override
    @Transactional
    public void discard(User user, Group group) {
        UserGroupId id = new UserGroupId(user.getId(), group.getId());
        this.userGroupDAO.removeUserGroup(id);
    }

}
