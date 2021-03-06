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

    /**
     *
     * @param group
     */
    public  void addGroup(Group group);

    /**
     *
     * @param group
     */
    public void updateGroup(Group group);

    /**
     *
     * @return
     */
    public List<Group> listGroups();

    /**
     *
     * @param id
     * @return
     */
    public Group getGroupById(int id);

    /**
     *
     * @param name
     * @return
     */
    public Group getGroupByName(String name);

    /**
     *
     * @param id
     */
    public void removeGroup(int id);

    /**
     *
     * @param group
     * @return
     */
    public boolean exist(Group group);
    
    /**
     *
     * @param user
     * @param group
     */
    public void invite(User user,Group group);

    /**
     *
     * @param user
     * @param group
     */
    public void subscribe (User user, Group group);

    /**
     *
     * @param user
     * @param group
     */
    public void discard(User user, Group group);

    /**
     *
     * @param user
     * @param group
     */
    public void accept(User user, Group group);
}
