package com.wms.service;

import com.wms.entity.Inventory;
import java.util.List;
import java.util.Map;

public interface InventoryService {
    List<Inventory> findAll();
    List<Inventory> findByCondition(String goodsName, String ownerName, Integer warehouseId);
    Inventory findByGoodsWarehouseOwner(Integer goodsId, Integer warehouseId, Integer ownerId);
    List<Inventory> findWarning();
    List<Inventory> findByWarehouse(Integer warehouseId);
    List<Inventory> findByOwner(Integer ownerId);
}
