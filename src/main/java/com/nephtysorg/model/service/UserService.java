/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nephtysorg.model.service;

import java.util.List;
import com.nephtysorg.model.pojo.Group;
import com.nephtysorg.model.pojo.Location;
import com.nephtysorg.model.pojo.User;
 
public interface UserService {
    public  void addUser(User user);
    public void updateUser(User user);
    public List<User> listUsers();
    public User getUserById(int id);
    public User getUserByName(String name);
    public void removeUser(int id);
    public boolean exist(User user);
    public List<Location> listLocations();
    public List<Group> getInvitationGroups (User user);
    public List<Group> getSubscriptionGroups (User user);
    public List<Group> getMemberGroups (User user);
}