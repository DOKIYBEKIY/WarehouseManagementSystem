package com.wms.service;

import com.wms.entity.SysUser;
import java.util.List;

public interface UserService {
    SysUser login(String username, String password);
    List<SysUser> findAll();
    SysUser findById(Integer id);
    void add(SysUser user);
    void update(SysUser user);
    void delete(Integer id);
    void updatePassword(Integer id, String newPassword);
}
