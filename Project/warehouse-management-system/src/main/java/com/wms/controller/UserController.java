package com.wms.controller;

import com.wms.entity.SysUser;
import com.wms.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @PostMapping("/login")
    public String login(
            @RequestParam String username,
            @RequestParam String password,
            HttpSession session){

        SysUser user = userService.login(username, password);

        if(user != null){
            session.setAttribute("user", user);
            return "redirect:/main.jsp";
        }

        return "redirect:/login.jsp";
    }
}