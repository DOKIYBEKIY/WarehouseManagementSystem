package com.wms.service;

import com.wms.entity.OutStock;
import java.util.List;
import java.util.Map;

public interface OutStockService {
    void add(OutStock outStock);
    List<OutStock> findAll();
    OutStock findById(Integer id);
    List<OutStock> findByCondition(String goodsName, Integer categoryId, String startTime, String endTime);
    List<Map<String, Object>> statistics(String type, String goodsName, Integer categoryId, String startTime, String endTime);
}
