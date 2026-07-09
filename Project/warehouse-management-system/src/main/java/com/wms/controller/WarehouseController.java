package com.wms.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


@Controller
@RequestMapping("/warehouse")
public class WarehouseController {



@GetMapping("/home")
public String home(Model model){


    model.addAttribute(
            "title",
            "仓库管理员中心"
    );


    model.addAttribute(
            "contentPage",
            "/WEB-INF/views/warehouse/home.jsp"
    );


    return "common/layout";

}


}