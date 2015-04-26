/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nephtysorg.model.dao;

import java.util.List;
import com.nephtysorg.model.pojo.Location;

/**
 *
 * @author cfollet
 */
public interface LocationDAO {
    public  void addLocation(Location location);
    public void updateLocation(Location location);
    public List<Location> listLocations();
    public Location getLocationById(int id);
    public Location getLocationByName(String name);
    public void removeLocation(int id);
    public boolean exist(Location location);
}
