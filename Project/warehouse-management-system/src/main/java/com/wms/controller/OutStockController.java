package com.wms.controller;

import com.wms.entity.*;
import com.wms.mapper.InventoryMapper;
import com.wms.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.util.Date;

@Controller
@RequestMapping("/stock/out")
public class OutStockController {

    @Autowired
    private OutStockService outStockService;
    @Autowired
    private GoodsService goodsService;
    @Autowired
    private WarehouseService warehouseService;
    @Autowired
    private OwnerService ownerService;
    @Autowired
    private InventoryMapper inventoryMapper;

    @GetMapping("/list")
    public String list(Model model) {
        model.addAttribute("outList", outStockService.findAll());
        model.addAttribute("title", "出库管理");
        model.addAttribute("active", "outStock");
        model.addAttribute("contentPage", "/WEB-INF/views/stock/outList.jsp");
        return "common/layout";
    }

    @GetMapping("/add")
    public String addPage(Model model) {
        model.addAttribute("goodsList", goodsService.findAll());
        model.addAttribute("warehouseList", warehouseService.findAll());
        model.addAttribute("ownerList", ownerService.findAll());
        model.addAttribute("title", "货物出库");
        model.addAttribute("active", "outStock");
        model.addAttribute("contentPage", "/WEB-INF/views/stock/outAdd.jsp");
        return "common/layout";
    }

    @PostMapping("/save")
    @Transactional
    public String save(OutStock outStock, HttpSession session, RedirectAttributes redirect) {
        try {
            SysUser user = (SysUser) session.getAttribute("user");
            if (user == null) {
                redirect.addFlashAttribute("error", "请先登录");
                return "redirect:/stock/out/add";
            }
            outStock.setOperatorId(user.getUserId());

            if (outStock.getOutTime() == null) {
                outStock.setOutTime(new Date());
            }

            // 防御性检查
            if (outStock.getUnitPrice() == null || outStock.getQuantity() == null) {
                redirect.addFlashAttribute("error", "单价和数量不能为空");
                return "redirect:/stock/out/add";
            }

            outStock.setTotalAmount(
                outStock.getUnitPrice().multiply(new BigDecimal(outStock.getQuantity()))
            );

            // 检查库存是否充足
            Inventory inv = inventoryMapper.findByGoodsWarehouseOwner(
                outStock.getGoodsId(), outStock.getWarehouseId(), outStock.getOwnerId()
            );
            if (inv == null || inv.getQuantity() < outStock.getQuantity()) {
                redirect.addFlashAttribute("error", "库存不足！当前库存：" + (inv == null ? 0 : inv.getQuantity()) + "，出库数量：" + outStock.getQuantity());
                return "redirect:/stock/out/add";
            }

            // 扣减库存
            int rows = inventoryMapper.decreaseQuantity(
                outStock.getGoodsId(), outStock.getWarehouseId(), outStock.getOwnerId(), outStock.getQuantity()
            );
            if (rows == 0) {
                redirect.addFlashAttribute("error", "库存不足，出库失败！");
                return "redirect:/stock/out/add";
            }

            outStockService.add(outStock);
            return "redirect:/stock/out/list";
        } catch (Exception e) {
            e.printStackTrace();
            redirect.addFlashAttribute("error", "出库失败：" + e.getMessage());
            return "redirect:/stock/out/add";
        }
    }

    @GetMapping("/detail/{id}")
    public String detail(@PathVariable Integer id, Model model) {
        model.addAttribute("record", outStockService.findById(id));
        model.addAttribute("title", "出库详情");
        model.addAttribute("active", "outStock");
        model.addAttribute("contentPage", "/WEB-INF/views/stock/outDetail.jsp");
        return "common/layout";
    }
}
