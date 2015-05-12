/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nephtysorg.model.dao;

import java.util.List;
import com.nephtysorg.model.pojo.UserGroup;
import com.nephtysorg.model.pojo.UserGroupId;

/**
 *
 * @author cfollet
 */
public interface UserGroupDAO {

    /**
     *
     * @param userGroup
     */
    public  void addUserGroup(UserGroup userGroup);

    /**
     *
     * @param userGroup
     */
    public void updateUserGroup(UserGroup userGroup);

    /**
     *
     * @return
     */
    public List<UserGroup> listUserGroups();

    /**
     *
     * @param id
     * @return
     */
    public UserGroup getUserGroupById(UserGroupId id);

    /**
     *
     * @param id
     */
    public void removeUserGroup(UserGroupId id);
}
