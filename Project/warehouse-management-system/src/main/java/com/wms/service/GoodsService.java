package com.wms.service;


import com.wms.entity.Goods;

import java.util.List;


public interface GoodsService {


    List<Goods> findAll();


    Goods findById(Integer id);


    void add(Goods goods);


    void update(Goods goods);


    void delete(Integer id);


}