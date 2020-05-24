package com.zyy.mp.dao;

import com.zyy.mp.pojo.Role;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface RoleDao {

    @Select("SELECT * FROM t_role")
    List<Role> findRoleList(Role role);
}
