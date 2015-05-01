/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nephtysorg.model.service;

import java.util.List;
import com.nephtysorg.model.pojo.Group;
import com.nephtysorg.model.pojo.User;

/**
 *
 * @author cfollet
 */
public interface GroupService {
    public  void addGroup(Group group);
    public void updateGroup(Group group);
    public List<Group> listGroups();
    public Group getGroupById(int id);
    public Group getGroupByName(String name);
    public void removeGroup(int id);
    public boolean exist(Group group);
    
    public void invite(User user,Group group);
    public void subscribe (User user, Group group);
    public void discard(User user, Group group);
    public void accept(User user, Group group);
}
