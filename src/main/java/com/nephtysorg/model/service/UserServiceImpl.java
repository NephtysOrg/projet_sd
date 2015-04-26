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
import com.nephtysorg.model.pojo.User;
import com.nephtysorg.model.pojo.UserGroup;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

 
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDAO userDAO;

    @Autowired
    private LocationDAO locationDAO;
   
     @Autowired
    private UserGroupDAO userGroupDAO;
    
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

    @Override
    @Transactional
    public void updateUser(User user) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    @Transactional
    public List<User> listUsers() {
        return this.userDAO.listUsers();
    }

    @Override
    @Transactional
    public User getUserById(int id) {
        return this.userDAO.getUserById(id);
    }

    @Override
    @Transactional
    public User getUserByName(String name) {
        return this.userDAO.getUserByName(name);
    }

    @Override
    @Transactional
    public void removeUser(int id) {
        this.userDAO.removeUser(id);
    }

    @Override
    @Transactional
    public boolean exist(User user) {
        return this.userDAO.exist(user);
    }


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
    
    
}