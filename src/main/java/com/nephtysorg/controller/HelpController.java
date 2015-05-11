/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nephtysorg.controller;

import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author cfollet
 */
@Controller
public class HelpController {
    
    /**
     *
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/help/index", method = RequestMethod.GET)
    public ModelAndView getIndex(HttpServletRequest request) throws Exception {
        ModelAndView mv = new ModelAndView("/help/index");

        return mv;
    }
}
