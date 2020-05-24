package com.zyy.mp.controller;

import com.zyy.mp.service.IDepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "/department")
public class DepartmentController {

    @Autowired
    IDepartmentService departmentService;
}
