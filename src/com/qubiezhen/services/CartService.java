package com.qubiezhen.services;

import com.qubiezhen.dao.dto.CartDto;
import com.qubiezhen.dao.dto.UserDTO;
import com.qubiezhen.dao.factory.CartDaoFactory;

import java.util.List;

/**
 * Created by yangj on 2016/12/21.
 */
public class CartService {
    public static Boolean addToCart(CartDto dto) {
        return CartDaoFactory.getCartDao().addToCart(dto);
    }

    public static List<CartDto> getCartDetail(CartDto dto) {
        return CartDaoFactory.getCartDao().getCartDetail(dto);
    }

    public static Boolean deleteFromCart(CartDto dto) {
        return CartDaoFactory.getCartDao().deleteFromCart(dto);
    }

    public static Boolean emptyFromCart(UserDTO udto) {
        return CartDaoFactory.getCartDao().emptyCart(udto);
    }
}
