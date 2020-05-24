package com.zyy.mp.service;

import com.github.pagehelper.PageInfo;
import com.zyy.mp.pojo.User;

import java.util.List;

public interface IUserService {

    List<User> getAllUser();

    User findByUserName(String username);

    PageInfo<User> findPage(Integer pageNo, Integer pageSize, User user);
}
