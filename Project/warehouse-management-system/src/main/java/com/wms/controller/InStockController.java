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
import java.util.List;

@Controller
@RequestMapping("/stock/in")
public class InStockController {

    @Autowired
    private InStockService inStockService;
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
        model.addAttribute("inList", inStockService.findAll());
        model.addAttribute("title", "入库管理");
        model.addAttribute("active", "inStock");
        model.addAttribute("contentPage", "/WEB-INF/views/stock/inList.jsp");
        return "common/layout";
    }

    @GetMapping("/add")
    public String addPage(Model model) {
        model.addAttribute("goodsList", goodsService.findAll());
        model.addAttribute("warehouseList", warehouseService.findAll());
        model.addAttribute("ownerList", ownerService.findAll());
        model.addAttribute("title", "货物入库");
        model.addAttribute("active", "inStock");
        model.addAttribute("contentPage", "/WEB-INF/views/stock/inAdd.jsp");
        return "common/layout";
    }

    @PostMapping("/save")
    @Transactional
    public String save(InStock inStock, HttpSession session, RedirectAttributes redirect) {
        try {
            SysUser user = (SysUser) session.getAttribute("user");
            if (user == null) {
                redirect.addFlashAttribute("error", "请先登录");
                return "redirect:/stock/in/add";
            }
            inStock.setOperatorId(user.getUserId());

            if (inStock.getInTime() == null) {
                inStock.setInTime(new Date());
            }

            // 防御性检查
            if (inStock.getUnitPrice() == null || inStock.getQuantity() == null) {
                redirect.addFlashAttribute("error", "单价和数量不能为空");
                return "redirect:/stock/in/add";
            }

            // 计算总金额
            inStock.setTotalAmount(
                inStock.getUnitPrice().multiply(new BigDecimal(inStock.getQuantity()))
            );

            // 保存入库记录
            inStockService.add(inStock);

            // 更新库存
            Inventory inv = inventoryMapper.findByGoodsWarehouseOwner(
                inStock.getGoodsId(), inStock.getWarehouseId(), inStock.getOwnerId()
            );
            if (inv != null) {
                inventoryMapper.increaseQuantity(
                    inStock.getGoodsId(), inStock.getWarehouseId(), inStock.getOwnerId(), inStock.getQuantity()
                );
            } else {
                Inventory newInv = new Inventory();
                newInv.setGoodsId(inStock.getGoodsId());
                newInv.setWarehouseId(inStock.getWarehouseId());
                newInv.setOwnerId(inStock.getOwnerId());
                newInv.setQuantity(inStock.getQuantity());
                newInv.setWarningQuantity(20);
                inventoryMapper.insert(newInv);
            }
            return "redirect:/stock/in/list";
        } catch (Exception e) {
            e.printStackTrace();
            redirect.addFlashAttribute("error", "入库失败：" + e.getMessage());
            return "redirect:/stock/in/add";
        }
    }

    @GetMapping("/detail/{id}")
    public String detail(@PathVariable Integer id, Model model) {
        model.addAttribute("record", inStockService.findById(id));
        model.addAttribute("title", "入库详情");
        model.addAttribute("active", "inStock");
        model.addAttribute("contentPage", "/WEB-INF/views/stock/inDetail.jsp");
        return "common/layout";
    }
}
