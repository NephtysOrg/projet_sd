package com.nephtysorg.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import com.nephtysorg.model.pojo.Group;
import com.nephtysorg.model.pojo.User;
import com.nephtysorg.model.service.GroupService;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 *
 * @author cfollet
 */
@Controller
public class GroupController {

    @Autowired
    private GroupService groupService;
    @Autowired
    private UserService userService;

    @RequestMapping(value = "/group/index", method = RequestMethod.GET)
    public ModelAndView getIndex(HttpServletRequest request, HttpServletResponse hsr1, Model model) throws Exception {
        ModelAndView mv = new ModelAndView("/group/index");
        User user = SessionUtil.getSessionUser(request);
        if (user == null) {
            mv = new ModelAndView("redirect:/user/login");
            return mv;
        }
        try {
            List<Group> lst = groupService.listGroups();
            user = this.userService.getUserById(user.getId());
            model.addAttribute(new Group());
            mv.addObject("groups", lst);
            mv.addObject("user", user);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return mv;
    }

    @RequestMapping(value = "/group/create", method = RequestMethod.GET)
    public ModelAndView getCreate(Model model, HttpServletRequest request) {
        User user = SessionUtil.getSessionUser(request);
        ModelAndView mv;

        if (user == null) {
            mv = new ModelAndView("redirect:/user/login");
        } else {
            model.addAttribute(new Group());
            mv = new ModelAndView("/group/create");
        }

        return mv;
    }

    @RequestMapping(value = "/group/create", method = RequestMethod.POST)
    public ModelAndView postCreate(@Valid @ModelAttribute("group") Group group, BindingResult result, HttpServletRequest request) {
        ModelAndView mv;
        User user = SessionUtil.getSessionUser(request);
        if (user == null) {
            mv = new ModelAndView("redirect:/user/login");
            return mv;
        }
        if (result.hasErrors()) {
            mv = new ModelAndView("/group/create");
            mv.addObject("callout", new Callout("warning", "Attention", "Verifiez vos données."));
            return mv;
        } else if (this.groupService.getGroupByName(group.getName()) == null) {
            group.setUser(user);
            System.out.println(group.getUser().getId());
            this.groupService.addGroup(group);
            mv = new ModelAndView("redirect:/home");
        } else {
            mv = new ModelAndView("/group/create");
            mv.addObject("callout", new Callout("warning", "Attention", "Le nom du groupe existe déja."));
        }
        return mv;
    }

    @RequestMapping(value = "/group/join", method = RequestMethod.POST)
    public ModelAndView postJoin(@Valid @ModelAttribute("group") Group group, BindingResult result, HttpServletRequest request, RedirectAttributes redirectAttributes) {
        ModelAndView mv = new ModelAndView("redirect:/group/index");
        User user = SessionUtil.getSessionUser(request);
        if (user == null) {
            mv = new ModelAndView("redirect:/user/login");
            return mv;
        }
        System.out.println(group);
        this.groupService.subscribe(user, group);
        redirectAttributes.addFlashAttribute("callout", new Callout("success", "Féllicitation", "La demande a été envoyée."));
        return mv;
    }

    @RequestMapping(value = "/group/edit/{id}", method = RequestMethod.GET)
    public ModelAndView getEdit(@PathVariable Integer id, Model model, HttpServletRequest request, RedirectAttributes redirectAttributes) {
        ModelAndView mv = new ModelAndView("/group/edit");
        Group group = this.groupService.getGroupById(id);
        User user = SessionUtil.getSessionUser(request);

        if (user == null) {
            mv = new ModelAndView("redirect:/user/login");
            return mv;
        } else {
            user = this.userService.getUserById(user.getId());
        }

        if (!user.getGroups().contains(group)) {
            redirectAttributes.addFlashAttribute("callout", new Callout("danger", "Attention", "Ce groupe ne vous appartiens pas."));
            mv = new ModelAndView("redirect:/home");
            return mv;
        }
        model.addAttribute(group);
        return mv;
    }

    @RequestMapping(value = "/group/edit/{id}", method = RequestMethod.POST)
    public ModelAndView postEdit(@Valid @ModelAttribute("group") Group group, BindingResult result, HttpServletRequest request,RedirectAttributes redirectAttributes, @PathVariable Integer id) {
        ModelAndView mv;

        if (result.hasErrors()) {
            mv = new ModelAndView("/group/edit");
        } else {
            Group old_group = this.groupService.getGroupById(id);
            // L'utilistateur a utilisé un nouveau nom et il est déja pris
            if (!group.getName().equals(old_group.getName()) && (this.groupService.getGroupByName(group.getName()) != null)) {
                mv = new ModelAndView("/group/edit");
                mv.addObject("callout", new Callout("warning", "Attention", "Le nouveau nom est déja pris."));
            } else {
                group.setUser((User) SessionUtil.getSessionUser(request));
                this.groupService.updateGroup(group);
                mv = new ModelAndView("redirect:/home");
                redirectAttributes.addFlashAttribute("callout", new Callout("success", "Fellicitation", "Le groupe <i>" + group.getName() + "</i> a été mis a jour."));
            }
        }
        return mv;
    }

    @RequestMapping(value = "/group/show/{id}", method = RequestMethod.GET)
    public ModelAndView getShow(@PathVariable Integer id, HttpServletRequest request) {
        ModelAndView mv = new ModelAndView("/group/show");
        User user = SessionUtil.getSessionUser(request);
        if (user == null) {
            mv = new ModelAndView("redirect:/user/login");
            return mv;
        }
        user = this.userService.getUserById(user.getId());
        Group group = this.groupService.getGroupById(id);
        List<User> users = this.userService.listUsers();
        mv.addObject("group", group);
        mv.addObject("users", users);
        return mv;
    }

    @RequestMapping(value = "/group/invite", method = RequestMethod.POST)
    public ModelAndView postInvite(@RequestParam(value = "users", required = false) List<Integer> allRequestParams,@RequestParam("group_id") Integer group_id, RedirectAttributes redirectAttributes, HttpServletRequest request) {
        ModelAndView mv = new ModelAndView("redirect:/group/show/"+group_id);
        
        if(allRequestParams == null){
            return mv;
        }
         
        for (Integer i : allRequestParams) {
            System.out.println(i);
            User usr = this.userService.getUserById(i);
            Group grp = this.groupService.getGroupById(group_id);
            this.groupService.invite(usr,grp);
        }
        
        if(allRequestParams.size() > 1){
            redirectAttributes.addFlashAttribute("callout", new Callout("success", "Fellicitation", "Les <i>"+allRequestParams.size()+"</i> invitations ont été envoyées"));
        }
        if(allRequestParams.size() == 1){
             redirectAttributes.addFlashAttribute("callout", new Callout("success", "Fellicitation", "L'invitation a été envoyée"));
        }
        
        return mv;
    }
}
