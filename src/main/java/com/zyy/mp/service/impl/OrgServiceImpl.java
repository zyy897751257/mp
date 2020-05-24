package com.zyy.mp.service.impl;

import com.zyy.mp.dao.OrgDao;
import com.zyy.mp.pojo.Org;
import com.zyy.mp.service.IOrgService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrgServiceImpl implements IOrgService {

    @Autowired
    OrgDao orgDao;


    @Override
    public List<Org> findAll() {
        return orgDao.findAll();
    }

    @Override
    public Org findOne(String orgCode) {
        return orgDao.findOne(orgCode);
    }

    @Override
    public void updateStatus(int status, Integer[] ids) {
        orgDao.updateStatus(status,ids);
    }

    @Override
    public void addOrg(Org org) {
        orgDao.addOrg(org);
        //TODO 增加菜单
    }

    @Override
    public void updateOrg(Org org) {
        orgDao.updateOrg(org);
        //TODO 修改菜单
    }
}
