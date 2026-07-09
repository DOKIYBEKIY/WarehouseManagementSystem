package com.wms.service.impl;


import com.wms.entity.Warehouse;
import com.wms.mapper.WarehouseMapper;
import com.wms.service.WarehouseService;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import java.util.List;



@Service
public class WarehouseServiceImpl 
implements WarehouseService {



    @Autowired
    private WarehouseMapper mapper;




    @Override
    public List<Warehouse> findAll(){

        return mapper.findAll();

    }




    @Override
    public Warehouse findById(Integer id){

        return mapper.findById(id);

    }




    @Override
    public void add(Warehouse warehouse){

        mapper.add(warehouse);

    }




    @Override
    public void update(Warehouse warehouse){

        mapper.update(warehouse);

    }




    @Override
    public void delete(Integer id){

        mapper.delete(id);

    }



}