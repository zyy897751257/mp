package com.zyy.mp.service.impl;

import com.zyy.mp.dao.MenuDao;
import com.zyy.mp.pojo.Menu;
import com.zyy.mp.service.IMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MenuServiceImpl implements IMenuService {

    @Autowired
    private MenuDao menuDao;

    @Override
    public List<Menu> getMenusByParentId(Integer parentId) {
        if (parentId == 0) {
            return menuDao.getParentMenus();
        } else {
            return menuDao.getMenusByParentId(parentId);
        }
    }
}
