package com.wms.service.impl;

import com.wms.entity.Owner;
import com.wms.mapper.OwnerMapper;
import com.wms.service.OwnerService;
import com.wms.util.AESUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class OwnerServiceImpl implements OwnerService {
    @Autowired
    private OwnerMapper mapper;

    @Override
    public List<Owner> findAll() {
        List<Owner> list = mapper.findAll();
        // AES解密敏感字段（仅列表不返回完整加密数据，可用于页面显式解密展示）
        // 这里直接返回密文，页面如果需要显示可以调用工具类；简单起见先不解密
        // 实际显示时在Controller层解密
        return list;
    }

    @Override
    public Owner findById(Integer id) { return mapper.findById(id); }

    @Override
    public void add(Owner owner) {
        // AES加密
        owner.setPhone(AESUtil.encrypt(owner.getPhone()));
        owner.setEmail(AESUtil.encrypt(owner.getEmail()));
        owner.setAddress(AESUtil.encrypt(owner.getAddress()));
        mapper.add(owner);
    }

    @Override
    public void update(Owner owner) {
        owner.setPhone(AESUtil.encrypt(owner.getPhone()));
        owner.setEmail(AESUtil.encrypt(owner.getEmail()));
        owner.setAddress(AESUtil.encrypt(owner.getAddress()));
        mapper.update(owner);
    }

    @Override
    public void delete(Integer id) { mapper.delete(id); }
}
