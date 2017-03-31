package com.qubiezhen.dao.dto;

import java.util.Date;
import java.util.List;

/**
 * Created by yangj on 2016/12/21.
 */
public class OrderDto {
    private Integer orderId;
    private Integer userId;
    private Integer buyUserId;
    private Date createTime;
    private Date completeTime;
    private Double sumPrice;
    private Integer orderStatus;
    private Integer businessType;
    private UserDTO udto;
    private List<SecendHandGoodsDto> sgList;


    public Integer getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(Integer order_status) {
        this.orderStatus = order_status;
    }

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public UserDTO getUdto() {
        return udto;
    }

    public void setUdto(UserDTO udto) {
        this.udto = udto;
    }

    public List<SecendHandGoodsDto> getSgList() {
        return sgList;
    }

    public void setSgList(List<SecendHandGoodsDto> sgList) {
        this.sgList = sgList;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getBuyUserId() {
        return buyUserId;
    }

    public void setBuyUserId(Integer buyUserId) {
        this.buyUserId = buyUserId;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getCompleteTime() {
        return completeTime;
    }

    public void setCompleteTime(Date completeTime) {
        this.completeTime = completeTime;
    }

    public Double getSumPrice() {
        return sumPrice;
    }

    public void setSumPrice(Double sumPrice) {
        this.sumPrice = sumPrice;
    }

    public Integer getBusinessType() {
        return businessType;
    }

    public void setBusinessType(Integer businessType) {
        this.businessType = businessType;
    }
}
