package com.wms.controller;


import com.wms.entity.Warehouse;
import com.wms.service.WarehouseService;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


import java.util.List;



@Controller
@RequestMapping("/warehouse/manage")
public class WarehouseManageController {



    @Autowired
    private WarehouseService service;





//    @GetMapping("/home")
//    public String home(Model model){
//
//        model.addAttribute(
//            "contentPage",
//            "/WEB-INF/views/warehouse/home.jsp"
//        );
//
//        return "common/layout";
//    }
    
    @GetMapping("/list")
    public String list(Model model){


        List<Warehouse> list =
                service.findAll();


        model.addAttribute(
                "warehouseList",
                list
        );


        model.addAttribute(
                "title",
                "仓库管理"
        );


        model.addAttribute(
                "active",
                "warehouse"
        );


        model.addAttribute(
                "contentPage",
                "/WEB-INF/views/warehouse/list.jsp"
        );



        return "common/layout";

    }





    @GetMapping("/add")
    public String addPage(Model model){


        model.addAttribute(
                "warehouse",
                new Warehouse()
        );


        model.addAttribute(
                "title",
                "新增仓库"
        );


        model.addAttribute(
                "active",
                "warehouse"
        );


        model.addAttribute(
                "contentPage",
                "/WEB-INF/views/warehouse/add.jsp"
        );


        return "common/layout";

    }






    @PostMapping("/save")
    public String save(
            Warehouse warehouse
    ){


        service.add(warehouse);


        return "redirect:/warehouse/manage/list";

    }





    @GetMapping("/edit/{id}")
    public String edit(
            @PathVariable Integer id,
            Model model
    ){


        model.addAttribute(
                "warehouse",
                service.findById(id)
        );


        model.addAttribute(
                "title",
                "修改仓库"
        );


        model.addAttribute(
                "active",
                "warehouse"
        );


        model.addAttribute(
                "contentPage",
                "/WEB-INF/views/warehouse/edit.jsp"
        );


        return "common/layout";

    }






    @PostMapping("/update")
    public String update(
            Warehouse warehouse
    ){


        service.update(warehouse);


        return "redirect:/warehouse/manage/list";

    }






    @GetMapping("/delete/{id}")
    public String delete(
            @PathVariable Integer id
    ){


        service.delete(id);


        return "redirect:/warehouse/manage/list";

    }



}