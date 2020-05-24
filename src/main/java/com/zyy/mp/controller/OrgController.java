package com.zyy.mp.controller;

import com.zyy.mp.entity.Result;
import com.zyy.mp.pojo.Org;
import com.zyy.mp.service.IOrgService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(value = "/org")
public class OrgController {

    @Autowired
    IOrgService orgService;

    @RequestMapping("/findAll")
    public Result findAll() {
        List<Org> orgList = orgService.findAll();
        return new Result(true, "查询成功",orgList);
    }

    @RequestMapping("/findOne/{orgCode}")
    public Result findOne(@PathVariable String orgCode) {
        Org org = orgService.findOne(orgCode);
        return new Result(true, "查询成功",org);
    }

    @RequestMapping("/updateOrgStatus")
    public Result updateOrgStatus(@RequestParam String status, @RequestBody Integer[] ids) {
        try {
            if (ids != null && ids.length > 0) {
                orgService.updateStatus(Integer.parseInt(status),ids);
                return new Result(true,"状态修改成功");
            }
            return new Result(false,"状态修改失败");
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false,"状态修改失败");
        }
    }

    @RequestMapping("/add")
    public Result addOrg(@RequestBody Org org) {
        try {
            orgService.addOrg(org);
            return new Result(true,"机构新增成功");
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false,"机构新增失败");
        }
    }

    @RequestMapping("/update")
    public Result updateOrg(@RequestBody Org org) {
        try {
            orgService.updateOrg(org);
            return new Result(true,"机构修改成功");
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false,"机构修改失败");
        }
    }

    /*@RequestMapping("/search")
    public PageInfo<Org> search() {

    }*/

}
