package com.zyy.mp.controller;

import com.zyy.mp.entity.Result;
import com.zyy.mp.pojo.Org;
import com.zyy.mp.pojo.Role;
import com.zyy.mp.service.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "/role")
public class RoleController {

    @Autowired
    IRoleService roleService;

    @RequestMapping("/search")
    public Result findPage(@RequestParam(value = "pageNo", defaultValue = "1", required = true) Integer pageNo,
                           @RequestParam(value = "pageSize", defaultValue = "10", required = true) Integer pageSize,
                           @RequestBody Role role) {
        return new Result(true, "查询成功", roleService.findPage(pageNo, pageSize, role));
    }

    @RequestMapping("/add")
    public Result addRole(@RequestBody Role role) {
        try {
            roleService.addRole(role);
            return new Result(true,"角色新增成功");
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false,"角色新增失败");
        }
    }

    @RequestMapping("/update")
    public Result updateRole(@RequestBody Role role) {
        try {
            roleService.updateRole(role);
            return new Result(true,"角色修改成功");
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false,"角色修改失败");
        }
    }

    @RequestMapping("/updateRoleMenus")
    public Result updateRoleMenus(@RequestBody int[] ids,@RequestParam String rId) {
        try {
            roleService.updateRoleMenus(rId,ids);
            return new Result(true,"角色菜单修改成功");
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false,"角色菜单修改失败");
        }
    }

}
