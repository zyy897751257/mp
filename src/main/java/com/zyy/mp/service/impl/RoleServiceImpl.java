package com.zyy.mp.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zyy.mp.dao.RoleDao;
import com.zyy.mp.pojo.Role;
import com.zyy.mp.service.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RoleServiceImpl implements IRoleService {

    @Autowired
    RoleDao roleDao;


    @Override
    public PageInfo<Role> findPage(Integer pageNo, Integer pageSize, Role role) {
        PageHelper.startPage(pageNo,pageSize);
        List<Role> userList = roleDao.findRoleList(role);
        PageInfo<Role> info = new PageInfo<Role>(userList);
        return info;
    }

    @Override
    public void addRole(Role role) {

    }

    @Override
    public void updateRole(Role role) {

    }

    @Override
    public void updateRoleMenus(String rId, int[] ids) {

    }
}
