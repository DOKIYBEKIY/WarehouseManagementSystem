package com.wms.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
@RequestMapping("/admin")
public class AdminController {


    @GetMapping("/home")
    public String home(Model model){


        model.addAttribute(
                "title",
                "管理员中心"
        );


        model.addAttribute(
                "contentPage",
                "/WEB-INF/views/admin/home.jsp"
        );


        return "common/layout";

    }

}