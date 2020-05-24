package com.zyy.mp.service;

import com.github.pagehelper.PageInfo;
import com.zyy.mp.pojo.Role;

public interface IRoleService {
    PageInfo<Role> findPage(Integer pageNo, Integer pageSize, Role role);

    void addRole(Role role);

    void updateRole(Role role);

    void updateRoleMenus(String rId,int[] ids);
}
