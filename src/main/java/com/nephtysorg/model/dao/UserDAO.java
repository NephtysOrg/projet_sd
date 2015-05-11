/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nephtysorg.model.dao;

import java.util.List;
import com.nephtysorg.model.pojo.User;


/**
 *
 * @author cfollet
 */
public interface UserDAO {

    /**
     *
     * @param user
     */
    public  void addUser(User user);

    /**
     *
     * @param user
     */
    public void updateUser(User user);

    /**
     *
     * @return
     */
    public List<User> listUsers();

    /**
     *
     * @param id
     * @return
     */
    public User getUserById(int id);

    /**
     *
     * @param name
     * @return
     */
    public User getUserByName(String name);

    /**
     *
     * @param id
     */
    public void removeUser(int id);

    /**
     *
     * @param user
     * @return
     */
    public boolean exist(User user);
}
