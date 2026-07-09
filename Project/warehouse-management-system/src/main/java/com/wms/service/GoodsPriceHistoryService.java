package com.wms.service;

import com.wms.entity.GoodsPriceHistory;
import java.util.List;

public interface GoodsPriceHistoryService {
    void save(GoodsPriceHistory history);
    List<GoodsPriceHistory> findByGoodsId(Integer goodsId);
    List<GoodsPriceHistory> findAll();
}
