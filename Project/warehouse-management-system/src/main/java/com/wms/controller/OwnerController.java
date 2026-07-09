package com.wms.controller;

import com.wms.entity.Owner;
import com.wms.service.OwnerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@Controller
@RequestMapping("/owner")
public class OwnerController {

    @Autowired
    private OwnerService service;

    @GetMapping("/list")
    public String list(Model model) {
        List<Owner> list = service.findAll();
        model.addAttribute("ownerList", list);
        model.addAttribute("title", "货主管理");
        model.addAttribute("active", "owner");
        model.addAttribute("contentPage", "/WEB-INF/views/owner/list.jsp");
        return "common/layout";
    }

    @GetMapping("/add")
    public String addPage(Model model) {
        model.addAttribute("owner", new Owner());
        model.addAttribute("title", "新增货主");
        model.addAttribute("active", "owner");
        model.addAttribute("contentPage", "/WEB-INF/views/owner/add.jsp");
        return "common/layout";
    }

    @PostMapping("/save")
    public String save(Owner owner) {
        service.add(owner);
        return "redirect:/owner/list";
    }

    @GetMapping("/edit/{id}")
    public String edit(@PathVariable Integer id, Model model) {
        Owner owner = service.findById(id);
        model.addAttribute("owner", owner);
        model.addAttribute("title", "修改货主");
        model.addAttribute("active", "owner");
        model.addAttribute("contentPage", "/WEB-INF/views/owner/edit.jsp");
        return "common/layout";
    }

    @PostMapping("/update")
    public String update(Owner owner) {
        service.update(owner);
        return "redirect:/owner/list";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable Integer id) {
        service.delete(id);
        return "redirect:/owner/list";
    }
}
