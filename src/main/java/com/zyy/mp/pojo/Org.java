package com.zyy.mp.pojo;

public class Org {
    private Integer id;
    private String orgCode;
    private String orgName;
    private String orgLevel;
    private String telephone;
    private String orgAddress;
    private String principal;
    private String orgStatus;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getOrgCode() {
        return orgCode;
    }

    public void setOrgCode(String orgCode) {
        this.orgCode = orgCode;
    }

    public String getOrgName() {
        return orgName;
    }

    public void setOrgName(String orgName) {
        this.orgName = orgName;
    }

    public String getOrgLevel() {
        return orgLevel;
    }

    public void setOrgLevel(String orgLevel) {
        this.orgLevel = orgLevel;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getOrgAddress() {
        return orgAddress;
    }

    public void setOrgAddress(String orgAddress) {
        this.orgAddress = orgAddress;
    }

    public String getPrincipal() {
        return principal;
    }

    public void setPrincipal(String principal) {
        this.principal = principal;
    }

    public String getOrgStatus() {
        return orgStatus;
    }

    public void setOrgStatus(String orgStatus) {
        this.orgStatus = orgStatus;
    }

    @Override
    public String toString() {
        return "Org{" +
                "id=" + id +
                ", orgCode='" + orgCode + '\'' +
                ", orgName='" + orgName + '\'' +
                ", orgLevel='" + orgLevel + '\'' +
                ", telephone='" + telephone + '\'' +
                ", orgAddress='" + orgAddress + '\'' +
                ", principal='" + principal + '\'' +
                ", orgStatus=" + orgStatus +
                '}';
    }
}
