package com.wms.service.impl;

import com.wms.entity.SysUser;
import com.wms.mapper.SysUserMapper;
import com.wms.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private SysUserMapper userMapper;

    @Override
    public SysUser login(String username, String password) {

        SysUser user = userMapper.login(username);

        if(user != null && password.equals(user.getPassword())){
            return user;
        }

        return null;
    }
}