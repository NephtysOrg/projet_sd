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
    public  void addUser(User user);
    public void updateUser(User user);
    public List<User> listUsers();
    public User getUserById(int id);
    public User getUserByName(String name);
    public void removeUser(int id);
    public boolean exist(User user);
}
