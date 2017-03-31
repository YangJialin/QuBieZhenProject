package com.qubiezhen.dao;

import com.qubiezhen.dao.dto.CartDto;
import com.qubiezhen.dao.dto.UserDTO;

import java.util.List;

/**
 * Created by yangj on 2016/12/21.
 */
public interface CartDao {
    CartDto getCartCount(CartDto cartDto);

    Boolean addToCart(CartDto cartDto);

    List<CartDto> getCartDetail(CartDto dto);

    Boolean deleteFromCart(CartDto dto);

    Boolean emptyCart(UserDTO udto);
}
