package com.zyy.mp.controller;

import com.zyy.mp.entity.Result;
import com.zyy.mp.pojo.Menu;
import com.zyy.mp.service.IMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/menu")
public class MenuController {

    @Autowired
    private IMenuService menuService;

    @RequestMapping("/getMenusByParentId/{parentId}")
    public Result getMenusByParentId(@PathVariable Integer parentId) {
        List<Menu> menuList = menuService.getMenusByParentId(parentId);
        return new Result(true, "查询成功",menuList);
    }
}
