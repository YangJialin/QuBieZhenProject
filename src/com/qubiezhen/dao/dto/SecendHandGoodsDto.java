package com.qubiezhen.dao.dto;

import java.sql.Date;

/**
 * Created by yangj on 2016/12/18.
 */
public class SecendHandGoodsDto {
    private Integer goodsId;
    private String goodsTitle;
    private String goodsDescribe;
    private Double goodsPrice;
    private Double goodsPriceLow;
    private Double goodsPriceHigh;
    private Integer authorId;
    private Date createTime;
    private String goodsImg;
    private String goodsType;
    private String goodsLocation;
    private String province;
    private String city;
    private Integer goodsCount;
    private Integer goodsStatus;

    public Integer getGoodsCount() {
        return goodsCount;
    }

    public void setGoodsCount(Integer goodsCount) {
        this.goodsCount = goodsCount;
    }


    public Integer getTimeRange() {
        return timeRange;
    }

    public Double getGoodsPriceLow() {
        return goodsPriceLow;
    }

    public void setGoodsPriceLow(Double goodsPriceLow) {
        this.goodsPriceLow = goodsPriceLow;
    }

    public Double getGoodsPriceHigh() {
        return goodsPriceHigh;
    }

    public void setGoodsPriceHigh(Double goodsPriceHigh) {
        this.goodsPriceHigh = goodsPriceHigh;
    }

    public void setTimeRange(Integer timeRange) {
        this.timeRange = timeRange;
    }

    private Integer timeRange;

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public Integer getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(Integer goodsId) {
        this.goodsId = goodsId;
    }

    public String getGoodsTitle() {
        return goodsTitle;
    }

    public void setGoodsTitle(String goodsTitle) {
        this.goodsTitle = goodsTitle;
    }

    public String getGoodsDescribe() {
        return goodsDescribe;
    }

    public void setGoodsDescribe(String goodsDescribe) {
        this.goodsDescribe = goodsDescribe;
    }

    public Double getGoodsPrice() {
        return goodsPrice;
    }

    public void setGoodsPrice(Double goodsPrice) {
        this.goodsPrice = goodsPrice;
    }

    public Integer getAuthorId() {
        return authorId;
    }

    public void setAuthorId(Integer authorId) {
        this.authorId = authorId;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getGoodsImg() {
        return goodsImg;
    }

    public void setGoodsImg(String goodsImg) {
        this.goodsImg = goodsImg;
    }

    public String getGoodsType() {
        return goodsType;
    }

    public void setGoodsType(String goodsType) {
        this.goodsType = goodsType;
    }

    public String getGoodsLocation() {
        return goodsLocation;
    }

    public void setGoodsLocation(String goodsLocation) {
        this.goodsLocation = goodsLocation;
    }

    public Integer getGoodsStatus() {
        return goodsStatus;
    }

    public void setGoodsStatus(Integer goodsStatus) {
        this.goodsStatus = goodsStatus;
    }
}
