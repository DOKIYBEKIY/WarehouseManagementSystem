package com.wms.mapper;

import com.wms.entity.SysUser;

public interface SysUserMapper {

    SysUser login(String username);
}