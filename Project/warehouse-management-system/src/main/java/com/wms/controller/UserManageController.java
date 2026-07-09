package com.wms.controller;

import com.wms.entity.SysRole;
import com.wms.entity.SysUser;
import com.wms.service.SysRoleService;
import com.wms.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserManageController {

    @Autowired
    private UserService userService;

    @Autowired
    private SysRoleService roleService;

    @GetMapping("/list")
    public String list(Model model) {
        List<SysUser> list = userService.findAll();
        model.addAttribute("userList", list);
        model.addAttribute("title", "用户管理");
        model.addAttribute("active", "user");
        model.addAttribute("contentPage", "/WEB-INF/views/user/list.jsp");
        return "common/layout";
    }

    @GetMapping("/add")
    public String addPage(Model model) {
        model.addAttribute("user", new SysUser());
        List<SysRole> roleList = roleService.findAll();
        model.addAttribute("roleList", roleList);
        model.addAttribute("title", "新增用户");
        model.addAttribute("active", "user");
        model.addAttribute("contentPage", "/WEB-INF/views/user/add.jsp");
        return "common/layout";
    }

    @PostMapping("/save")
    public String save(SysUser user) {
        userService.add(user);
        return "redirect:/user/list";
    }

    @GetMapping("/edit/{id}")
    public String edit(@PathVariable Integer id, Model model) {
        SysUser user = userService.findById(id);
        model.addAttribute("user", user);
        List<SysRole> roleList = roleService.findAll();
        model.addAttribute("roleList", roleList);
        model.addAttribute("title", "修改用户");
        model.addAttribute("active", "user");
        model.addAttribute("contentPage", "/WEB-INF/views/user/edit.jsp");
        return "common/layout";
    }

    @PostMapping("/update")
    public String update(SysUser user) {
        userService.update(user);
        return "redirect:/user/list";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable Integer id) {
        userService.delete(id);
        return "redirect:/user/list";
    }

    @GetMapping("/resetPwd/{id}")
    public String resetPwdPage(@PathVariable Integer id, Model model) {
        model.addAttribute("userId", id);
        model.addAttribute("title", "重置密码");
        model.addAttribute("active", "user");
        model.addAttribute("contentPage", "/WEB-INF/views/user/resetPwd.jsp");
        return "common/layout";
    }

    @PostMapping("/resetPwd")
    public String resetPwd(@RequestParam Integer userId, @RequestParam String newPassword) {
        userService.updatePassword(userId, newPassword);
        return "redirect:/user/list";
    }
}
