package com.wms.controller;


import com.wms.entity.GoodsCategory;
import com.wms.service.GoodsCategoryService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@Controller
@RequestMapping("/category")
public class GoodsCategoryController {


    @Autowired
    private GoodsCategoryService service;



    /**
     * 分类列表
     */
    @GetMapping("/list")
    public String list(Model model){


        List<GoodsCategory> list =
                service.findAll();


        model.addAttribute(
                "categoryList",
                list
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



    /**
     * 新增页面
     */
    @GetMapping("/add")
    public String addPage(Model model){


        model.addAttribute(
                "title",
                "新增商品分类"
        );


        model.addAttribute(
                "category",
                new GoodsCategory()
        );


        model.addAttribute(
                "contentPage",
                "/WEB-INF/views/category/add.jsp"
        );


        return "common/layout";

    }





    /**
     * 保存新增
     */
    @PostMapping("/save")
    public String save(
            GoodsCategory category
    ){


        service.add(category);


        return "redirect:/category/list";

    }





    /**
     * 修改页面
     */
    @GetMapping("/edit/{id}")
    public String edit(
            @PathVariable Integer id,
            Model model
    ){


        GoodsCategory category =
                service.findById(id);



        model.addAttribute(
                "category",
                category
        );


        model.addAttribute(
                "title",
                "修改商品分类"
        );


        model.addAttribute(
                "contentPage",
                "/WEB-INF/views/category/edit.jsp"
        );



        return "common/layout";


    }




    /**
     * 更新
     */
    @PostMapping("/update")
    public String update(
            GoodsCategory category
    ){


        service.update(category);


        return "redirect:/category/list";

    }




    /**
     * 删除
     */
    @GetMapping("/delete/{id}")
    public String delete(
            @PathVariable Integer id
    ){


        service.delete(id);


        return "redirect:/category/list";

    }


}