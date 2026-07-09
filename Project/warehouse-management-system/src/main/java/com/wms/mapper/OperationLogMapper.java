package com.wms.mapper;

import com.wms.entity.OperationLog;
import java.util.List;

public interface OperationLogMapper {
    int insert(OperationLog log);
    List<OperationLog> findAll();
    List<OperationLog> findByUserId(Integer userId);
}
