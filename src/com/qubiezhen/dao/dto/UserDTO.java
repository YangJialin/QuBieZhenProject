package com.qubiezhen.dao.dto;

import java.sql.Date;

/**
 * Created by yangj on 2016/12/5.
 */
public class UserDTO {
    private Integer userId;
    private String mobile;
    private String userName;
    private String email;
    private String password;
    private String showName;
    private Integer sex;
    //    private String birthday;
    private Date birthday;
    private Date createTime;
    private Integer score;
    private String city;
    private String province;
    private String address;
    private Integer isAuthentication;
    private Integer isAvalible;
    private String picImg;
    private Integer msgNum;
    private Integer countSell;
    private Integer countBuy;

    public Integer getCountSell() {
        return countSell;
    }

    public void setCountSell(Integer countSell) {
        this.countSell = countSell;
    }

    public Integer getCountBuy() {
        return countBuy;
    }

    public void setCountBuy(Integer countBuy) {
        this.countBuy = countBuy;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getShowName() {
        return showName;
    }

    public void setShowName(String showName) {
        this.showName = showName;
    }

    public Integer getSex() {
        return sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Integer getIsAuthentication() {
        return isAuthentication;
    }

    public void setIsAuthentication(Integer isAuthentication) {
        this.isAuthentication = isAuthentication;
    }

    public Integer getIsAvalible() {
        return isAvalible;
    }

    public void setIsAvalible(Integer isAvalible) {
        this.isAvalible = isAvalible;
    }

    public String getPicImg() {
        return picImg;
    }

    public void setPicImg(String picImg) {
        this.picImg = picImg;
    }

    public Integer getMsgNum() {
        return msgNum;
    }

    public void setMsgNum(Integer msgNum) {
        this.msgNum = msgNum;
    }

    @Override
    public String toString() {
        return super.toString();
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }
}
