package com.zyy.mp.pojo;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

public class User implements Serializable {

    private Integer id;
    private String username;
    @JsonFormat(pattern = "yyyy-MM-dd",timezone = "GMT+8")
    private Date birthday;
    private int gender;
    private String password;
    private String status;
    private int dept_id;
    private int org;
    private Set<Role> roles = new HashSet<Role>(0);//对应角色集合

    public User() {
    }

    public User(Integer id, String username, Date birthday, int gender, String password, String status, int dept_id, int org) {
        this.id = id;
        this.username = username;
        this.birthday = birthday;
        this.gender = gender;
        this.password = password;
        this.status = status;
        this.dept_id = dept_id;
        this.org = org;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public int getGender() {
        return gender;
    }

    public void setGender(int gender) {
        this.gender = gender;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getDept_id() {
        return dept_id;
    }

    public void setDept_id(int dept_id) {
        this.dept_id = dept_id;
    }

    public int getOrg() {
        return org;
    }

    public void setOrg(int org) {
        this.org = org;
    }

    public Set<Role> getRoles() {
        return roles;
    }

    public void setRoles(Set<Role> roles) {
        this.roles = roles;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", birthday=" + birthday +
                ", gender=" + gender +
                ", password='" + password + '\'' +
                ", status=" + status +
                ", dept_id=" + dept_id +
                ", org=" + org +
                '}';
    }
}


