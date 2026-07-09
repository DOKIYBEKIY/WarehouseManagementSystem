package com.wms.service;


import com.wms.entity.GoodsCategory;

import java.util.List;


public interface GoodsCategoryService {


    List<GoodsCategory> findAll();


    GoodsCategory findById(Integer id);


    void add(GoodsCategory category);


    void update(GoodsCategory category);


    void delete(Integer id);


}