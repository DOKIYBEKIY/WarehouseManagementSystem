package com.wms.service.impl;


import com.wms.entity.Goods;
import com.wms.mapper.GoodsMapper;
import com.wms.service.GoodsService;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import java.util.List;



@Service
public class GoodsServiceImpl implements GoodsService {



@Autowired
private GoodsMapper mapper;



@Override
public List<Goods> findAll(){

    return mapper.findAll();

}



@Override
public Goods findById(Integer id){

    return mapper.findById(id);

}



@Override
public void add(Goods goods){

    mapper.add(goods);

}



@Override
public void update(Goods goods){

    mapper.update(goods);

}



@Override
public void delete(Integer id){

    mapper.delete(id);

}



}