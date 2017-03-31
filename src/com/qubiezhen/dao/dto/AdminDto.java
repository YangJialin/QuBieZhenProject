package com.qubiezhen.dao.dto;

import java.sql.Date;

/**
 * Created by yangj on 2016/12/12.
 */
public class AdminDto {
    private Integer adminId;
    private String adminName;
    private String adminPassword;
    private Integer adminType;
    private String adminEmail;
    private Date lastLoginTime;

    public Integer getAdminId() {
        return adminId;
    }

    public void setAdminId(Integer adminId) {
        this.adminId = adminId;
    }

    public String getAdminName() {
        return adminName;
    }

    public void setAdminName(String adminName) {
        this.adminName = adminName;
    }

    public String getAdminPassword() {
        return adminPassword;
    }

    public void setAdminPassword(String adminPassword) {
        this.adminPassword = adminPassword;
    }

    public Integer getAdminType() {
        return adminType;
    }

    public void setAdminType(Integer adminType) {
        this.adminType = adminType;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        AdminDto admin = (AdminDto) o;

        if (adminName != null ? !adminName.equals(admin.adminName) : admin.adminName != null) return false;
        if (adminPassword != null ? !adminPassword.equals(admin.adminPassword) : admin.adminPassword != null)
            return false;
        return adminType != null ? adminType.equals(admin.adminType) : admin.adminType == null;

    }

    @Override
    public int hashCode() {
        int result = adminName != null ? adminName.hashCode() : 0;
        result = 31 * result + (adminPassword != null ? adminPassword.hashCode() : 0);
        result = 31 * result + (adminType != null ? adminType.hashCode() : 0);
        return result;
    }

    public String getAdminEmail() {
        return adminEmail;
    }

    public void setAdminEmail(String adminEmail) {
        this.adminEmail = adminEmail;
    }

    public Date getLastLoginTime() {
        return lastLoginTime;
    }

    public void setLastLoginTime(Date lastLoginTime) {
        this.lastLoginTime = lastLoginTime;
    }
}
