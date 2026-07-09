package com.wms.service.impl;

import com.wms.entity.OutStock;
import com.wms.mapper.OutStockMapper;
import com.wms.service.OutStockService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class OutStockServiceImpl implements OutStockService {
    @Autowired
    private OutStockMapper mapper;

    @Override
    public void add(OutStock outStock) { mapper.insert(outStock); }

    @Override
    public List<OutStock> findAll() { return mapper.findAll(); }

    @Override
    public OutStock findById(Integer id) { return mapper.findById(id); }

    @Override
    public List<OutStock> findByCondition(String goodsName, Integer categoryId, String startTime, String endTime) {
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
