package com.wms.mapper;

import com.wms.entity.SysUser;
import java.util.List;
import java.util.Map;

public interface SysUserMapper {
    SysUser login(String username);
    List<SysUser> findAll();
    SysUser findById(Integer id);
    int add(SysUser user);
    int update(SysUser user);
    int delete(Integer id);
    int updateStatus(Integer id, Integer status);
    int updatePassword(Integer id, String password);
}
