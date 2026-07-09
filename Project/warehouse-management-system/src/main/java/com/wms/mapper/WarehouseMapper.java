package com.wms.mapper;


import com.wms.entity.Warehouse;

import java.util.List;


public interface WarehouseMapper {


    List<Warehouse> findAll();


    Warehouse findById(Integer id);


    int add(Warehouse warehouse);


    int update(Warehouse warehouse);


    int delete(Integer id);


}