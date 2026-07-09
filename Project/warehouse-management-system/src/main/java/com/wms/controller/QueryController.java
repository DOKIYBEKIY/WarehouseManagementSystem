package com.wms.controller;

import com.wms.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/query")
public class QueryController {

    @Autowired
    private InventoryService inventoryService;

    @Autowired
    private InStockService inStockService;

    @Autowired
    private OutStockService outStockService;

    @Autowired
    private GoodsService goodsService;

    @Autowired
    private GoodsCategoryService categoryService;

    @Autowired
    private WarehouseService warehouseService;

    @Autowired
    private OwnerService ownerService;

    @GetMapping("/home")
    public String home(Model model) {
        model.addAttribute("title", "查询统计中心");
        model.addAttribute("contentPage", "/WEB-INF/views/query/home.jsp");
        return "common/layout";
    }

    // ============== 库存查询 ==============

    @GetMapping("/inventory")
    public String inventory(Model model,
            @RequestParam(required = false) String goodsName,
            @RequestParam(required = false) String ownerName,
            @RequestParam(required = false) Integer warehouseId) {
        model.addAttribute("invList", inventoryService.findByCondition(goodsName, ownerName, warehouseId));
        model.addAttribute("warehouseList", warehouseService.findAll());
        model.addAttribute("goodsName", goodsName);
        model.addAttribute("ownerName", ownerName);
        model.addAttribute("warehouseId", warehouseId);
        model.addAttribute("title", "库存查询");
        model.addAttribute("active", "inventory");
        model.addAttribute("contentPage", "/WEB-INF/views/query/inventory.jsp");
        return "common/layout";
    }

    @GetMapping("/warning")
    public String warning(Model model) {
        model.addAttribute("warningList", inventoryService.findWarning());
        model.addAttribute("title", "库存预警");
        model.addAttribute("active", "warning");
        model.addAttribute("contentPage", "/WEB-INF/views/query/warning.jsp");
        return "common/layout";
    }

    // ============== 入库查询统计 ==============

    @GetMapping("/inStock")
    public String inStockQuery(Model model,
            @RequestParam(required = false) String goodsName,
            @RequestParam(required = false) Integer categoryId,
            @RequestParam(required = false) String startTime,
            @RequestParam(required = false) String endTime) {
        model.addAttribute("inList", inStockService.findByCondition(goodsName, categoryId, startTime, endTime));
        model.addAttribute("categoryList", categoryService.findAll());
        model.addAttribute("goodsName", goodsName);
        model.addAttribute("categoryId", categoryId);
        model.addAttribute("startTime", startTime);
        model.addAttribute("endTime", endTime);
        model.addAttribute("title", "入库记录查询");
        model.addAttribute("active", "inStockQuery");
        model.addAttribute("contentPage", "/WEB-INF/views/query/inStock.jsp");
        return "common/layout";
    }

    @GetMapping("/inStockStats")
    public String inStockStats(Model model,
            @RequestParam(required = false, defaultValue = "month") String type,
            @RequestParam(required = false) String goodsName,
            @RequestParam(required = false) Integer categoryId,
            @RequestParam(required = false) String startTime,
            @RequestParam(required = false) String endTime) {
        List<Map<String, Object>> stats = inStockService.statistics(type, goodsName, categoryId, startTime, endTime);
        model.addAttribute("statsList", stats);
        model.addAttribute("categoryList", categoryService.findAll());
        model.addAttribute("type", type);
        model.addAttribute("goodsName", goodsName);
        model.addAttribute("categoryId", categoryId);
        model.addAttribute("startTime", startTime);
        model.addAttribute("endTime", endTime);
        model.addAttribute("title", "入库统计");
        model.addAttribute("active", "inStockStats");
        model.addAttribute("contentPage", "/WEB-INF/views/query/inStockStats.jsp");
        return "common/layout";
    }

    // ============== 出库查询统计 ==============

    @GetMapping("/outStock")
    public String outStockQuery(Model model,
            @RequestParam(required = false) String goodsName,
            @RequestParam(required = false) Integer categoryId,
            @RequestParam(required = false) String startTime,
            @RequestParam(required = false) String endTime) {
        model.addAttribute("outList", outStockService.findByCondition(goodsName, categoryId, startTime, endTime));
        model.addAttribute("categoryList", categoryService.findAll());
        model.addAttribute("goodsName", goodsName);
        model.addAttribute("categoryId", categoryId);
        model.addAttribute("startTime", startTime);
        model.addAttribute("endTime", endTime);
        model.addAttribute("title", "出库记录查询");
        model.addAttribute("active", "outStockQuery");
        model.addAttribute("contentPage", "/WEB-INF/views/query/outStock.jsp");
        return "common/layout";
    }

    @GetMapping("/outStockStats")
    public String outStockStats(Model model,
            @RequestParam(required = false, defaultValue = "month") String type,
            @RequestParam(required = false) String goodsName,
            @RequestParam(required = false) Integer categoryId,
            @RequestParam(required = false) String startTime,
            @RequestParam(required = false) String endTime) {
        List<Map<String, Object>> stats = outStockService.statistics(type, goodsName, categoryId, startTime, endTime);
        model.addAttribute("statsList", stats);
        model.addAttribute("categoryList", categoryService.findAll());
        model.addAttribute("type", type);
        model.addAttribute("goodsName", goodsName);
        model.addAttribute("categoryId", categoryId);
        model.addAttribute("startTime", startTime);
        model.addAttribute("endTime", endTime);
        model.addAttribute("title", "出库统计");
        model.addAttribute("active", "outStockStats");
        model.addAttribute("contentPage", "/WEB-INF/views/query/outStockStats.jsp");
        return "common/layout";
    }
}
