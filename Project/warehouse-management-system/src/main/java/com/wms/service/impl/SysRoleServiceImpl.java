package com.wms.service.impl;

import com.wms.entity.SysRole;
import com.wms.mapper.SysRoleMapper;
import com.wms.service.SysRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class SysRoleServiceImpl implements SysRoleService {
    @Autowired
    private SysRoleMapper mapper;

    @Override
    public List<SysRole> findAll() { return mapper.findAll(); }

    @Override
    public SysRole findById(Integer id) { return mapper.findById(id); }
}
