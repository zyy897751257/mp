package com.zyy.mp.service;

import com.zyy.mp.pojo.Menu;

import java.util.List;

public interface IMenuService {

    List<Menu> getMenusByParentId(Integer parentId);
}
