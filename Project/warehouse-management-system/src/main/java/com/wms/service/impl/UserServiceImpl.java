package com.wms.service.impl;

import com.wms.entity.SysUser;
import com.wms.mapper.SysUserMapper;
import com.wms.service.UserService;
import com.wms.util.AESUtil;
import com.wms.util.BCryptUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private SysUserMapper userMapper;

    @Override
    public SysUser login(String username, String password) {
        SysUser user = userMapper.login(username);
        if (user != null && BCryptUtil.verify(password, user.getPassword())) {
            return user;
        }
        return null;
    }

    @Override
    public List<SysUser> findAll() { return userMapper.findAll(); }

    @Override
    public SysUser findById(Integer id) { return userMapper.findById(id); }

    @Override
    public void add(SysUser user) {
        user.setPassword(BCryptUtil.hash(user.getPassword()));
        user.setPhone(AESUtil.encrypt(user.getPhone()));
        user.setEmail(AESUtil.encrypt(user.getEmail()));
        userMapper.add(user);
    }

    @Override
    public void update(SysUser user) {
        user.setPhone(AESUtil.encrypt(user.getPhone()));
        user.setEmail(AESUtil.encrypt(user.getEmail()));
        userMapper.update(user);
    }

    @Override
    public void delete(Integer id) { userMapper.delete(id); }

    @Override
    public void updatePassword(Integer id, String newPassword) {
        userMapper.updatePassword(id, BCryptUtil.hash(newPassword));
    }
}
