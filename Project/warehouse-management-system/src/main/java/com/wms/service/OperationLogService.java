package com.wms.service;

import com.wms.entity.OperationLog;
import java.util.List;

public interface OperationLogService {
    void log(Integer userId, String operationType, String operationContent, String ipAddress);
    List<OperationLog> findAll();
    List<OperationLog> findByUserId(Integer userId);
}
