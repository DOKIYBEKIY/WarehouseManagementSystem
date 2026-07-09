package com.wms.service;

import com.wms.entity.InStock;
import java.util.List;
import java.util.Map;

public interface InStockService {
    void add(InStock inStock);
    List<InStock> findAll();
    InStock findById(Integer id);
    List<InStock> findByCondition(String goodsName, Integer categoryId, String startTime, String endTime);
    List<Map<String, Object>> statistics(String type, String goodsName, Integer categoryId, String startTime, String endTime);
}
