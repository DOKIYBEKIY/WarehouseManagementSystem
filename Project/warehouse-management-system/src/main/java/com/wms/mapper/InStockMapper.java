package com.wms.mapper;

import com.wms.entity.InStock;
import java.util.List;
import java.util.Map;

public interface InStockMapper {
    int insert(InStock inStock);
    List<InStock> findAll();
    InStock findById(Integer id);

    List<InStock> findByCondition(Map<String, Object> params);

    List<Map<String, Object>> statistics(Map<String, Object> params);
}
