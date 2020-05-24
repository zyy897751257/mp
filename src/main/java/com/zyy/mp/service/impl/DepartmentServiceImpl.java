package com.zyy.mp.service.impl;

import com.zyy.mp.dao.DepartmentDao;
import com.zyy.mp.service.IDepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DepartmentServiceImpl implements IDepartmentService {

    @Autowired
    DepartmentDao departmentDao;
}
