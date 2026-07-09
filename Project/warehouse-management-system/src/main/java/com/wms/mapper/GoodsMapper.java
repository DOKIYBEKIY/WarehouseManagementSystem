package com.wms.mapper;


import com.wms.entity.Goods;

import java.util.List;


public interface GoodsMapper {


    List<Goods> findAll();


    Goods findById(Integer id);


    int add(Goods goods);


    int update(Goods goods);


    int delete(Integer id);


}