package com.qubiezhen.dao.dto;

import java.util.Date;

/**
 * Created by yangj on 2016/12/28.
 */
public class AskToBuyDto {
    private Integer askId;
    private Integer userId;
    private UserDTO udto;
    private String askImg;
    private String askTitle;
    private String askDetails;
    private Date createTime;

    public Integer getAskId() {
        return askId;
    }

    public void setAskId(Integer askId) {
        this.askId = askId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public UserDTO getUdto() {
        return udto;
    }

    public void setUdto(UserDTO udto) {
        this.udto = udto;
    }

    public String getAskImg() {
        return askImg;
    }

    public void setAskImg(String askImg) {
        this.askImg = askImg;
    }

    public String getAskTitle() {
        return askTitle;
    }

    public void setAskTitle(String askTitle) {
        this.askTitle = askTitle;
    }

    public String getAskDetails() {
        return askDetails;
    }

    public void setAskDetails(String askDetails) {
        this.askDetails = askDetails;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}
