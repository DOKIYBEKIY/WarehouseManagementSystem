package com.wms.mapper;


import com.wms.entity.GoodsCategory;

import java.util.List;


public interface GoodsCategoryMapper {


    List<GoodsCategory> findAll();



    GoodsCategory findById(Integer id);



    int add(GoodsCategory category);



    int update(GoodsCategory category);



    int delete(Integer id);


}