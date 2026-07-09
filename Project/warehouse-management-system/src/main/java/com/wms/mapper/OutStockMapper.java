package com.wms.mapper;

import com.wms.entity.OutStock;
import java.util.List;
import java.util.Map;

public interface OutStockMapper {
    int insert(OutStock outStock);
    List<OutStock> findAll();
    OutStock findById(Integer id);
    List<OutStock> findByCondition(Map<String, Object> params);
    List<Map<String, Object>> statistics(Map<String, Object> params);
}
