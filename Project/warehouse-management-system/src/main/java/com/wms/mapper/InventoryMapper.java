package com.wms.mapper;

import com.wms.entity.Inventory;
import org.apache.ibatis.annotations.Param;
import java.util.List;
import java.util.Map;

public interface InventoryMapper {
    List<Inventory> findAll();

    List<Inventory> findByCondition(Map<String, Object> params);

    Inventory findByGoodsWarehouseOwner(
        @Param("goodsId") Integer goodsId,
        @Param("warehouseId") Integer warehouseId,
        @Param("ownerId") Integer ownerId);

    int increaseQuantity(
        @Param("goodsId") Integer goodsId,
        @Param("warehouseId") Integer warehouseId,
        @Param("ownerId") Integer ownerId,
        @Param("quantity") Integer quantity);

    int decreaseQuantity(
        @Param("goodsId") Integer goodsId,
        @Param("warehouseId") Integer warehouseId,
        @Param("ownerId") Integer ownerId,
        @Param("quantity") Integer quantity);

    int insert(Inventory inventory);

    List<Inventory> findWarning();

    List<Inventory> findByWarehouse(Integer warehouseId);

    List<Inventory> findByOwner(Integer ownerId);
}
