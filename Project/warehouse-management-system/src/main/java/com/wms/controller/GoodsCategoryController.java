package com.wms.controller;


import com.wms.entity.GoodsCategory;
import com.wms.service.GoodsCategoryService;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;



@Controller
@RequestMapping("/category")
public class GoodsCategoryController {



    @Autowired
    private GoodsCategoryService service;




    @GetMapping("/list")
    public String list(Model model){


        model.addAttribute(
            "categoryList",
            service.findAll()
        );


        model.addAttribute(
            "title",
            "商品分类管理"
        );


        model.addAttribute(
            "active",
            "category"
        );


        model.addAttribute(
            "contentPage",
            "/WEB-INF/views/category/list.jsp"
        );


        return "common/layout";

    }




    @GetMapping("/add")
    public String addPage(){


        return "category/add";

    }




    @PostMapping("/add")
    public String add(
            GoodsCategory category){


        service.add(category);


        return "redirect:/category/list";

    }



    @GetMapping("/delete/{id}")
    public String delete(
            @PathVariable Integer id){


        service.delete(id);


        return "redirect:/category/list";

    }

}