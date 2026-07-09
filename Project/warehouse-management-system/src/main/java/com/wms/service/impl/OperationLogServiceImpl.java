package com.wms.service.impl;

import com.wms.entity.OperationLog;
import com.wms.mapper.OperationLogMapper;
import com.wms.service.OperationLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.Date;
import java.util.List;

@Service
public class OperationLogServiceImpl implements OperationLogService {
    @Autowired
    private OperationLogMapper mapper;

    @Override
    public void log(Integer userId, String operationType, String operationContent, String ipAddress) {
        OperationLog log = new OperationLog();
        log.setUserId(userId);
        log.setOperationType(operationType);
        log.setOperationContent(operationContent);
        log.setIpAddress(ipAddress);
        mapper.insert(log);
    }

    @Override
    public List<OperationLog> findAll() { return mapper.findAll(); }

    @Override
    public List<OperationLog> findByUserId(Integer userId) { return mapper.findByUserId(userId); }
}
