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

    /**
     *
     * @param location
     */
    public  void addLocation(Location location);

    /**
     *
     * @param location
     */
    public void updateLocation(Location location);

    /**
     *
     * @return
     */
    public List<Location> listLocations();

    /**
     *
     * @param id
     * @return
     */
    public Location getLocationById(int id);

    /**
     *
     * @param name
     * @return
     */
    public Location getLocationByName(String name);

    /**
     *
     * @param id
     */
    public void removeLocation(int id);

    /**
     *
     * @param location
     * @return
     */
    public boolean exist(Location location);
}
