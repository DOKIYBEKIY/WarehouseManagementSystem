package com.wms.service.impl;

import com.wms.entity.GoodsPriceHistory;
import com.wms.mapper.GoodsPriceHistoryMapper;
import com.wms.service.GoodsPriceHistoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class GoodsPriceHistoryServiceImpl implements GoodsPriceHistoryService {
    @Autowired
    private GoodsPriceHistoryMapper mapper;

    @Override
    public void save(GoodsPriceHistory history) { mapper.insert(history); }

    @Override
    public List<GoodsPriceHistory> findByGoodsId(Integer goodsId) { return mapper.findByGoodsId(goodsId); }

    @Override
    public List<GoodsPriceHistory> findAll() { return mapper.findAll(); }
}
