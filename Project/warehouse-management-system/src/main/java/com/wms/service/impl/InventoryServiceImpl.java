package com.wms.service.impl;

import com.wms.entity.Inventory;
import com.wms.mapper.InventoryMapper;
import com.wms.service.InventoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class InventoryServiceImpl implements InventoryService {
    @Autowired
    private InventoryMapper mapper;

    @Override
    public List<Inventory> findAll() { return mapper.findAll(); }

    @Override
    public List<Inventory> findByCondition(String goodsName, String ownerName, Integer warehouseId) {
        Map<String, Object> params = new HashMap<>();
        params.put("goodsName", goodsName);
        params.put("ownerName", ownerName);
        params.put("warehouseId", warehouseId);
        return mapper.findByCondition(params);
    }

    @Override
    public Inventory findByGoodsWarehouseOwner(Integer goodsId, Integer warehouseId, Integer ownerId) {
        return mapper.findByGoodsWarehouseOwner(goodsId, warehouseId, ownerId);
    }

    @Override
    public List<Inventory> findWarning() { return mapper.findWarning(); }

    @Override
    public List<Inventory> findByWarehouse(Integer warehouseId) { return mapper.findByWarehouse(warehouseId); }

    @Override
    public List<Inventory> findByOwner(Integer ownerId) { return mapper.findByOwner(ownerId); }
}
