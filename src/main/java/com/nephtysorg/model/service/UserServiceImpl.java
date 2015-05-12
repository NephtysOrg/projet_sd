/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nephtysorg.model.service;

import com.nephtysorg.model.dao.LocationDAO;
import com.nephtysorg.model.dao.UserDAO;
import com.nephtysorg.model.dao.UserGroupDAO;
import com.nephtysorg.model.pojo.Group;
import com.nephtysorg.model.pojo.Location;
import com.nephtysorg.model.pojo.User;
import com.nephtysorg.model.pojo.UserGroup;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author cfollet
 */
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDAO userDAO;

    @Autowired
    private LocationDAO locationDAO;
   
     @Autowired
    private UserGroupDAO userGroupDAO;
    
    /**
     *
     * @param user
     */
    @Override
    @Transactional
    public void addUser(User user) {
        if(!locationDAO.exist(user.getLocation())){
            locationDAO.addLocation(user.getLocation());
        }else{
            user.setLocation(locationDAO.getLocationByName(user.getLocation().getLabel()));
        }
        userDAO.addUser(user);
    }

    /**
     *
     * @param user
     */
    @Override
    @Transactional
    public void updateUser(User user) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    /**
     *
     * @return
     */
    @Override
    @Transactional
    public List<User> listUsers() {
        return this.userDAO.listUsers();
    }

    /**
     *
     * @param id
     * @return
     */
    @Override
    @Transactional
    public User getUserById(int id) {
        return this.userDAO.getUserById(id);
    }

    /**
     *
     * @param name
     * @return
     */
    @Override
    @Transactional
    public User getUserByName(String name) {
        return this.userDAO.getUserByName(name);
    }

    /**
     *
     * @param id
     */
    @Override
    @Transactional
    public void removeUser(int id) {
        this.userDAO.removeUser(id);
    }

    /**
     *
     * @param user
     * @return
     */
    @Override
    @Transactional
    public boolean exist(User user) {
        return this.userDAO.exist(user);
    }

    /**
     *
     * @param user
     * @return
     */
    @Override
    public List<Group> getInvitationGroups(User user) {
        List <UserGroup> listUserGroup = this.userGroupDAO.listUserGroups();
        List<Group> groups = new ArrayList<>();
        for (UserGroup ug : listUserGroup) {
            if(ug.getUser().getId().equals(user.getId()) && ug.getInvited() == 1){
                groups.add(ug.getGroup());
            }
        }
        return groups;
    }

    /**
     *
     * @param user
     * @return
     */
    @Override
    public List<Group> getSubscriptionGroups(User user) {
        List <UserGroup> listUserGroup = this.userGroupDAO.listUserGroups();
        List<Group> groups = new ArrayList<>();
        for (UserGroup ug : listUserGroup) {
            if(ug.getUser().getId().equals(user.getId()) && ug.getSubscribed()== 1){
                groups.add(ug.getGroup());
            }
        }
        return groups;
    }

    /**
     *
     * @param user
     * @return
     */
    @Override
    public List<Group> getMemberGroups(User user) {
        List <UserGroup> listUserGroup = this.userGroupDAO.listUserGroups();
        List<Group> groups = new ArrayList<>();
        for (UserGroup ug : listUserGroup) {
            if(!ug.getGroup().getUser().getId().equals(user.getId()) && ug.getUser().getId().equals(user.getId()) && ug.getSubscribed()== 0 && ug.getInvited()== 0){
                groups.add(ug.getGroup());
            }
        }
        return groups;
    }

    /**
     *
     * @return
     */
    @Override
    public List<Location> listLocations() {
        return this.locationDAO.listLocations();
    }
    
    
}