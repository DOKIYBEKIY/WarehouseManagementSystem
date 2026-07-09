package com.wms.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


@Controller
@RequestMapping("/query")
public class QueryController {



@GetMapping("/home")
public String home(Model model){


    model.addAttribute(
            "title",
            "查询统计中心"
    );


    model.addAttribute(
            "contentPage",
            "/WEB-INF/views/query/home.jsp"
    );


    return "common/layout";

}


}