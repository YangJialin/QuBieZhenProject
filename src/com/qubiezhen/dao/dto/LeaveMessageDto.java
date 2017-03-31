package com.qubiezhen.dao.dto;

import java.sql.Date;

/**
 * Created by yangj on 2016/12/24.
 */
public class LeaveMessageDto {
    private Integer leaveMessageId;
    private Integer goodsId;
    private Date createTime;
    private Integer marketUserId;
    private String messageDetails;
    private UserDTO udto;

    public Integer getLeaveMessageId() {
        return leaveMessageId;
    }

    public void setLeaveMessageId(Integer leaveMessageId) {
        this.leaveMessageId = leaveMessageId;
    }

    public Integer getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(Integer goodsId) {
        this.goodsId = goodsId;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getMarketUserId() {
        return marketUserId;
    }

    public void setMarketUserId(Integer marketUserId) {
        this.marketUserId = marketUserId;
    }

    public String getMessageDetails() {
        return messageDetails;
    }

    public void setMessageDetails(String messageDetails) {
        this.messageDetails = messageDetails;
    }

    public UserDTO getUdto() {
        return udto;
    }

    public void setUdto(UserDTO udto) {
        this.udto = udto;
    }
}
