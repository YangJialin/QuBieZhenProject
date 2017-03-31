package com.qubiezhen.dao.dto;

import java.util.List;

/**
 * Created by yangj on 2016/12/21.
 */
public class CartDto {
    private Integer cartId;
    private Integer userId;
    private Integer goodsId;
    private SecendHandGoodsDto sgdto;

    private Integer goodsCount;
    private Double goodsPriceCount;
    private List<CartDto> cartList;

    public SecendHandGoodsDto getSgdto() {
        return sgdto;
    }

    public void setSgdto(SecendHandGoodsDto sgdto) {
        this.sgdto = sgdto;
    }


    public Integer getCartId() {
        return cartId;
    }

    public void setCartId(Integer cartId) {
        this.cartId = cartId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(Integer goodsId) {
        this.goodsId = goodsId;
    }

    public Integer getGoodsCount() {
        return goodsCount;
    }

    public void setGoodsCount(Integer goodsCount) {
        this.goodsCount = goodsCount;
    }

    public Double getGoodsPriceCount() {
        return goodsPriceCount;
    }

    public void setGoodsPriceCount(Double goodsPriceCount) {
        this.goodsPriceCount = goodsPriceCount;
    }

    public List<CartDto> getCartList() {
        return cartList;
    }

    public void setCartList(List<CartDto> cartList) {
        this.cartList = cartList;
    }
}
