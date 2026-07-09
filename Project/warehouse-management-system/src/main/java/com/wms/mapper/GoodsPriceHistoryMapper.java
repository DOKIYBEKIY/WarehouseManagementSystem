package com.wms.mapper;

import com.wms.entity.GoodsPriceHistory;
import java.util.List;

public interface GoodsPriceHistoryMapper {
    int insert(GoodsPriceHistory history);

    List<GoodsPriceHistory> findByGoodsId(Integer goodsId);

    List<GoodsPriceHistory> findAll();
}
