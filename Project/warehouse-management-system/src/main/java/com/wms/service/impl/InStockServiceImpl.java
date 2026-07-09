package com.wms.service.impl;

import com.wms.entity.InStock;
import com.wms.mapper.InStockMapper;
import com.wms.service.InStockService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class InStockServiceImpl implements InStockService {
    @Autowired
    private InStockMapper mapper;

    @Override
    public void add(InStock inStock) { mapper.insert(inStock); }

    @Override
    public List<InStock> findAll() { return mapper.findAll(); }

    @Override
    public InStock findById(Integer id) { return mapper.findById(id); }

    @Override
    public List<InStock> findByCondition(String goodsName, Integer categoryId, String startTime, String endTime) {
        Map<String, Object> params = new HashMap<>();
        params.put("goodsName", goodsName);
        params.put("categoryId", categoryId);
        params.put("startTime", startTime);
        params.put("endTime", endTime);
        return mapper.findByCondition(params);
    }

    @Override
    public List<Map<String, Object>> statistics(String type, String goodsName, Integer categoryId, String startTime, String endTime) {
        Map<String, Object> params = new HashMap<>();
        params.put("type", type);
        params.put("goodsName", goodsName);
        params.put("categoryId", categoryId);
        params.put("startTime", startTime);
        params.put("endTime", endTime);
        return mapper.statistics(params);
    }
}
