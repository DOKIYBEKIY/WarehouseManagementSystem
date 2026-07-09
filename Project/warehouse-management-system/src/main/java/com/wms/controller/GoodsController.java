package com.wms.controller;

import com.wms.entity.Goods;
import com.wms.entity.GoodsPriceHistory;
import com.wms.entity.SysUser;
import com.wms.service.GoodsCategoryService;
import com.wms.service.GoodsPriceHistoryService;
import com.wms.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/goods")
public class GoodsController {

    @Autowired
    private GoodsService service;
    @Autowired
    private GoodsCategoryService categoryService;
    @Autowired
    private GoodsPriceHistoryService priceHistoryService;

    @GetMapping("/list")
    public String list(Model model) {
        List<Goods> list = service.findAll();
        model.addAttribute("goodsList", list);
        model.addAttribute("title", "物资信息管理");
        model.addAttribute("active", "goods");
        model.addAttribute("contentPage", "/WEB-INF/views/goods/list.jsp");
        return "common/layout";
    }

    @GetMapping("/add")
    public String addPage(Model model) {
        model.addAttribute("goods", new Goods());
        model.addAttribute("categoryList", categoryService.findAll());
        model.addAttribute("title", "新增物资");
        model.addAttribute("active", "goods");
        model.addAttribute("contentPage", "/WEB-INF/views/goods/add.jsp");
        return "common/layout";
    }

    @PostMapping("/save")
    public String save(Goods goods, RedirectAttributes redirect) {
        try {
            service.add(goods);
        } catch (Exception e) {
            redirect.addFlashAttribute("error", "保存失败，物资编码可能已存在！");
            return "redirect:/goods/add";
        }
        return "redirect:/goods/list";
    }

    @GetMapping("/edit/{id}")
    public String edit(@PathVariable Integer id, Model model) {
        Goods goods = service.findById(id);
        model.addAttribute("goods", goods);
        model.addAttribute("categoryList", categoryService.findAll());
        model.addAttribute("title", "修改物资");
        model.addAttribute("active", "goods");
        model.addAttribute("contentPage", "/WEB-INF/views/goods/edit.jsp");
        return "common/layout";
    }

    @PostMapping("/update")
    public String update(Goods goods, HttpSession session, RedirectAttributes redirect) {
        try {
            Goods old = service.findById(goods.getGoodsId());
            if (old != null && old.getPrice().compareTo(goods.getPrice()) != 0) {
                GoodsPriceHistory history = new GoodsPriceHistory();
                history.setGoodsId(goods.getGoodsId());
                history.setOldPrice(old.getPrice());
                history.setNewPrice(goods.getPrice());
                SysUser user = (SysUser) session.getAttribute("user");
                history.setUpdateUser(user.getUserId());
                priceHistoryService.save(history);
            }
            service.update(goods);
        } catch (Exception e) {
            redirect.addFlashAttribute("error", "修改失败！");
            return "redirect:/goods/edit/" + goods.getGoodsId();
        }
        return "redirect:/goods/list";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable Integer id) {
        service.delete(id);
        return "redirect:/goods/list";
    }

    @GetMapping("/priceHistory/{id}")
    public String priceHistory(@PathVariable Integer id, Model model) {
        model.addAttribute("historyList", priceHistoryService.findByGoodsId(id));
        model.addAttribute("goodsName", service.findById(id).getGoodsName());
        model.addAttribute("title", "价格历史");
        model.addAttribute("active", "goods");
        model.addAttribute("contentPage", "/WEB-INF/views/goods/priceHistory.jsp");
        return "common/layout";
    }

}
