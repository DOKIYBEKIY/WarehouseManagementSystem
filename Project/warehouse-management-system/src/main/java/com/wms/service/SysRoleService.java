package com.wms.service;

import com.wms.entity.SysRole;
import java.util.List;

public interface SysRoleService {
    List<SysRole> findAll();
    SysRole findById(Integer id);
}
