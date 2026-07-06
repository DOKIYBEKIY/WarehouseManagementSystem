package com.wms.service;

import com.wms.entity.SysUser;

public interface UserService {
    SysUser login(String username, String password);
}