package com.wms.service;


import com.wms.entity.Warehouse;

import java.util.List;


public interface WarehouseService {


    List<Warehouse> findAll();


    Warehouse findById(Integer id);


    void add(Warehouse warehouse);


    void update(Warehouse warehouse);


    void delete(Integer id);


}