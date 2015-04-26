/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nephtysorg.model.utils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import com.nephtysorg.model.pojo.User;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author cfollet
 */
public class SessionUtil {
    public static User getSessionUser (HttpServletRequest request){
        HttpSession session = request.getSession();
        return (User) session.getAttribute("user");
    }
}
