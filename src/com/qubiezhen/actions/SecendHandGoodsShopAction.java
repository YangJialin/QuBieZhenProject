package com.qubiezhen.actions;

import com.opensymphony.xwork2.ActionSupport;
import com.qubiezhen.dao.dto.CartDto;
import com.qubiezhen.services.CartService;
import com.qubiezhen.services.GetCartInfoService;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by yangj on 2016/12/21.
 */
public class SecendHandGoodsShopAction extends ActionSupport {
    private CartDto cartdto;
    private List<CartDto> cartList;

    public List<CartDto> getCartList() {
        return cartList;
    }

    public void setCartList(List<CartDto> cartList) {
        this.cartList = cartList;
    }


    public CartDto getCartdto() {
        return cartdto;
    }

    public void setCartdto(CartDto cartdto) {
        this.cartdto = cartdto;
    }

    /**
     * 查看购物车数量和价格
     *
     * @return
     */
    public String queryCartCount() {
        CartDto tempdto = GetCartInfoService.getCartCount(cartdto);
        if (tempdto != null) {
            return SUCCESS;
        }
        return ERROR;
    }

    /**
     * 加入商品到购物车
     *
     * @return
     */
    public String addToCart() {
        if (CartService.addToCart(cartdto)) {
            return SUCCESS;
        }
        return ERROR;
    }

    /**
     * 取得购物车中商品详细
     *
     * @return
     */
    public String queryCartDetail() {
        List<CartDto> list = new ArrayList<>();
        list = CartService.getCartDetail(cartdto);
        if (list.size() > 0) {
            this.cartList = list;
            return SUCCESS;
        }
        return ERROR;
    }

    public String deleteFromCart() {
        if (CartService.deleteFromCart(cartdto)) {
            return SUCCESS;
        }
        return ERROR;
    }
}
