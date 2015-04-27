/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nephtysorg.controller;

import java.util.List;
import java.util.Set;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import com.nephtysorg.model.pojo.Group;
import com.nephtysorg.model.pojo.User;
import com.nephtysorg.model.service.UserService;
import com.nephtysorg.model.utils.Callout;
import com.nephtysorg.model.utils.SessionUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 * Manage user management request
 *
 * @author cfollet
 */
@Controller
public class UserController {

    @Autowired
    private UserService userService;

    /**
     *
     * @param hsr
     * @param hsr1
     * @return
     */
    @RequestMapping(value = "/user/index", method = RequestMethod.GET)
    public ModelAndView getIndex(HttpServletRequest request, HttpServletResponse hsr1) {
        ModelAndView mv = new ModelAndView("/user/index");
        User user = SessionUtil.getSessionUser(request);
        if (user == null) {
            mv = new ModelAndView("redirect:/user/login");
            return mv;
        }
        List<User> lst = userService.listUsers();
        mv.addObject("users", lst);
        return mv;
    }

    /**
     *
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/user/login", method = RequestMethod.GET)
    public ModelAndView getLogin(Model model) throws Exception {
        ModelAndView mv = new ModelAndView("/user/login");
        model.addAttribute(new User());
        return mv;
    }

    /**
     *
     * @param user
     * @param result
     * @param request
     * @return
     */
    @RequestMapping(value = "/user/login", method = RequestMethod.POST)
    public ModelAndView postLogin(@Valid @ModelAttribute("user") User user, BindingResult result, HttpServletRequest request) {
        ModelAndView mv;
        HttpSession session = request.getSession();
        if (result.hasErrors()) {
            mv = new ModelAndView("/user/login");
            return mv;
        }
        if (userService.exist(user)) {
            user = userService.getUserByName(user.getLogin());
            
            session.setAttribute("user", user);
            mv = new ModelAndView("redirect:/home");
        } else {
            mv = new ModelAndView("/user/login");
            mv.addObject("callout", new Callout("danger", "Erreur", "Mauvaise combinaison Login/Mot de passe"));
        }

        return mv;
    }
    
    @RequestMapping(value = "/user/logout", method = RequestMethod.GET)
    public ModelAndView getLogOut(HttpServletRequest request){
        HttpSession session = request.getSession();
        session.invalidate();
        return new ModelAndView("redirect:/user/login");
    }

    /**
     *
     * @param model
     * @return
     */
    @RequestMapping(value = "/user/create", method = RequestMethod.GET)
    public ModelAndView getCreate(Model model) {
        ModelAndView mv = new ModelAndView("/user/create");
        model.addAttribute(new User());
        return mv;
    }

    /**
     *
     * @param user
     * @param result
     * @return
     */
    @RequestMapping(value = "/user/create", method = RequestMethod.POST)
    public ModelAndView postCreate(RedirectAttributes redirectAttr, @Valid @ModelAttribute("user") User user, BindingResult result) {
        ModelAndView mv = new ModelAndView("/user/create");
        if (result.hasErrors()) {
            return mv;
        } else if (this.userService.getUserByName(user.getLogin()) == null) {
            redirectAttr.addFlashAttribute("callout", new Callout("success", "Fellicitation", "Nous avons crée votre compte. Vous pouvez vous connecter."));
            this.userService.addUser(user);
            mv = new ModelAndView("redirect:/user/login");
        } else {
            mv.addObject("callout", new Callout("warning", "Attention", "Ce nom d'utilisateur est déja pris."));
        }
        return mv;
    }

    /**
     *
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/home", method = RequestMethod.GET)
    public ModelAndView getHome(HttpServletRequest request) throws Exception {
        ModelAndView mv;
        User user = SessionUtil.getSessionUser(request);
        if (user == null) {
            mv = new ModelAndView("redirect:/user/login");
        } else {
            mv = new ModelAndView("/home");
            user = this.userService.getUserById(user.getId());
            
            Set<Group> groups = user.getGroups();
            mv.addObject("groups", groups);
            
            List<Group> member_groups = this.userService.getMemberGroups(user);
            mv.addObject("member_groups", member_groups);
            
            List<Group> invitation_groups = this.userService.getInvitationGroups(user);
            mv.addObject("invitation_groups", invitation_groups);
            
            List<Group> subscription_groups = this.userService.getSubscriptionGroups(user);
            mv.addObject("subscription_groups", subscription_groups);
            
        }

        return mv;
    }
    
    
    @RequestMapping(value="/user/show/{id}", method=RequestMethod.GET)
    public ModelAndView getShow(@PathVariable Integer id, HttpServletRequest request) {
        ModelAndView mv = new ModelAndView("/user/show");
        User user = this.userService.getUserById(id);
        mv.addObject("usr", user);
        return mv;
    }
}
