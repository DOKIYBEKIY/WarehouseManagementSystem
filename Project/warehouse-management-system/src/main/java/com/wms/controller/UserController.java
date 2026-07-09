package com.wms.controller;


import com.wms.entity.SysUser;
import com.wms.service.UserService;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import javax.servlet.http.HttpSession;



@Controller
public class UserController {



    @Autowired
    private UserService userService;




    @PostMapping("/login")
    public String login(
            @RequestParam String username,
            @RequestParam String password,
            HttpSession session,
            RedirectAttributes redirect) {



        SysUser user =
                userService.login(
                        username,
                        password);


        if (user == null) {
            redirect.addFlashAttribute("error", "账号或密码错误，请重试");
            return "redirect:/login.jsp";
        }




        session.setAttribute(
                "user",
                user
        );



        Integer roleId = user.getRoleId();


        if (Integer.valueOf(1).equals(roleId)) {

            return "redirect:/admin/home";

        } else if (Integer.valueOf(2).equals(roleId)) {

            return "redirect:/warehouse/home";

        } else {

            return "redirect:/query/home";

        }


    }



    @GetMapping("/logout")
    public String logout(
            HttpSession session){


        session.invalidate();


        return "redirect:/login.jsp";


    }



}
