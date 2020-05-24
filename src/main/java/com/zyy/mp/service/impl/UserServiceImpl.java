package com.zyy.mp.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zyy.mp.dao.UserDao;
import com.zyy.mp.pojo.User;
import com.zyy.mp.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements IUserService {

    @Autowired
    UserDao userDao;


    @Override
    public List<User> getAllUser() {
        return userDao.getAllUser();
    }

    @Override
    public User findByUserName(String username) {

        return userDao.getUserByUsername(username);
    }

    @Override
    public PageInfo<User> findPage(Integer pageNo, Integer pageSize, User user) {
        PageHelper.startPage(pageNo,pageSize);
        List<User> userList = userDao.findUserList(user);
        PageInfo<User> info = new PageInfo<User>(userList);
        return info;
    }
}
