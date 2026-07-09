package com.wms.service.impl;


import com.wms.entity.GoodsCategory;
import com.wms.mapper.GoodsCategoryMapper;
import com.wms.service.GoodsCategoryService;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import java.util.List;



@Service
public class GoodsCategoryServiceImpl
        implements GoodsCategoryService {



    @Autowired
    private GoodsCategoryMapper mapper;



    @Override
    public List<GoodsCategory> findAll() {

        return mapper.findAll();

    }



    @Override
    public GoodsCategory findById(Integer id) {

        return mapper.findById(id);

    }



    @Override
    public void add(GoodsCategory category) {

        mapper.insert(category);

    }



    @Override
    public void update(GoodsCategory category) {

        mapper.update(category);

    }



    @Override
    public void delete(Integer id) {

        mapper.delete(id);

    }


}