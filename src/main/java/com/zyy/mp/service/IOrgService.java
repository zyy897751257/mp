package com.zyy.mp.service;

import com.zyy.mp.pojo.Org;

import java.util.List;

public interface IOrgService {

    List<Org> findAll();

    Org findOne(String orgCode);

    void updateStatus(int status, Integer[] ids);

    void addOrg(Org org);

    void updateOrg(Org org);
}
