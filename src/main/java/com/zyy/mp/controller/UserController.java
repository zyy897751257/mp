package com.zyy.mp.controller;

import com.zyy.mp.entity.Result;
import com.zyy.mp.pojo.User;
import com.zyy.mp.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping(value = "/user")
public class UserController {

    @Autowired
    IUserService userService;

    @RequestMapping(value = "/getAllUser")
    public Result getAllUser() {
        List<User> userList = userService.getAllUser();
        return new Result(true,"访问成功",userList);
    }

    @RequestMapping("/search")
    public Result findPage(@RequestParam(value = "pageNo", defaultValue = "1", required = true) Integer pageNo,
                                      @RequestParam(value = "pageSize", defaultValue = "10", required = true) Integer pageSize,
                                      @RequestBody User user) {
        return new Result(true, "查询成功", userService.findPage(pageNo, pageSize, user));
    }
}
