/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nephtysorg.model.dao;

import java.util.List;
import com.nephtysorg.model.pojo.Group;

/**
 *
 * @author cfollet
 */
public interface GroupDAO {
    public  void addGroup(Group group);
    public void updateGroup(Group group);
    public List<Group> listGroups();
    public Group getGroupById(int id);
    public Group getGroupByName(String name);
    public void removeGroup(int id);
    public boolean exist(Group group);
}
