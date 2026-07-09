package com.wms.controller;


import com.wms.entity.Goods;
import com.wms.service.GoodsCategoryService;
import com.wms.service.GoodsService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;



@Controller
@RequestMapping("/goods")
public class GoodsController {


    @Autowired
    private GoodsService service;
    
    @Autowired
    private GoodsCategoryService categoryService;



    /**
     * 商品列表
     */
    @GetMapping("/list")
    public String list(Model model){


        List<Goods> list =
                service.findAll();



        model.addAttribute(
                "goodsList",
                list
        );


        model.addAttribute(
                "title",
                "物资信息管理"
        );


        model.addAttribute(
                "active",
                "goods"
        );


        model.addAttribute(
                "contentPage",
                "/WEB-INF/views/goods/list.jsp"
        );


        return "common/layout";

    }




    /**
     * 新增页面
     */
    @GetMapping("/add")
    public String addPage(Model model){


        model.addAttribute(
                "goods",
                new Goods()
        );


        model.addAttribute(
                "categoryList",
                categoryService.findAll()
        );


        model.addAttribute(
                "title",
                "新增物资"
        );


        model.addAttribute(
                "active",
                "goods"
        );


        model.addAttribute(
                "contentPage",
                "/WEB-INF/views/goods/add.jsp"
        );


        return "common/layout";

    }




    /**
     * 保存
     */
    @PostMapping("/save")
    public String save(
            Goods goods
    ){


        service.add(goods);


        return "redirect:/goods/list";

    }





    /**
     * 修改页面
     */
    @GetMapping("/edit/{id}")
    public String edit(
            @PathVariable Integer id,
            Model model
    ){


        Goods goods =
                service.findById(id);



        model.addAttribute(
                "goods",
                goods
        );


        model.addAttribute(
                "categoryList",
                categoryService.findAll()
        );



        model.addAttribute(
                "title",
                "修改物资"
        );


        model.addAttribute(
                "active",
                "goods"
        );



        model.addAttribute(
                "contentPage",
                "/WEB-INF/views/goods/edit.jsp"
        );



        return "common/layout";


    }




    /**
     * 更新
     */
    @PostMapping("/update")
    public String update(
            Goods goods
    ){


        service.update(goods);


        return "redirect:/goods/list";

    }





    /**
     * 删除
     */
    @GetMapping("/delete/{id}")
    public String delete(
            @PathVariable Integer id
    ){


        service.delete(id);


        return "redirect:/goods/list";


    }


}