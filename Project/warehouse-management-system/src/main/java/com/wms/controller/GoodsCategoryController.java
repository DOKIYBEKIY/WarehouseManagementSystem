package com.wms.controller;

import com.wms.entity.GoodsCategory;
import com.wms.service.GoodsCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import java.util.List;

@Controller
@RequestMapping("/category")
public class GoodsCategoryController {

    @Autowired
    private GoodsCategoryService service;

    @GetMapping("/list")
    public String list(Model model) {
        List<GoodsCategory> list = service.findAll();
        model.addAttribute("categoryList", list);
        model.addAttribute("title", "商品分类管理");
        model.addAttribute("active", "category");
        model.addAttribute("contentPage", "/WEB-INF/views/category/list.jsp");
        return "common/layout";
    }

    @GetMapping("/add")
    public String addPage(Model model) {
        model.addAttribute("title", "新增商品分类");
        model.addAttribute("category", new GoodsCategory());
        model.addAttribute("active", "category");
        model.addAttribute("contentPage", "/WEB-INF/views/category/add.jsp");
        return "common/layout";
    }

    @PostMapping("/save")
    public String save(GoodsCategory category, RedirectAttributes redirect) {
        try {
            service.add(category);
        } catch (Exception e) {
            redirect.addFlashAttribute("error", "保存失败，分类名称可能已存在！");
            return "redirect:/category/add";
        }
        return "redirect:/category/list";
    }

    @GetMapping("/edit/{id}")
    public String edit(@PathVariable Integer id, Model model) {
        GoodsCategory category = service.findById(id);
        model.addAttribute("category", category);
        model.addAttribute("title", "修改商品分类");
        model.addAttribute("active", "category");
        model.addAttribute("contentPage", "/WEB-INF/views/category/edit.jsp");
        return "common/layout";
    }

    @PostMapping("/update")
    public String update(GoodsCategory category, RedirectAttributes redirect) {
        try {
            service.update(category);
        } catch (Exception e) {
            redirect.addFlashAttribute("error", "修改失败，分类名称可能重复！");
            return "redirect:/category/edit/" + category.getCategoryId();
        }
        return "redirect:/category/list";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable Integer id) {
        service.delete(id);
        return "redirect:/category/list";
    }

}
