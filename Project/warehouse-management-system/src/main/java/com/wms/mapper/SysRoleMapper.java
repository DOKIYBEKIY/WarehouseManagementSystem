package com.wms.mapper;

import com.wms.entity.SysRole;
import java.util.List;

public interface SysRoleMapper {
    List<SysRole> findAll();
    SysRole findById(Integer id);
}
