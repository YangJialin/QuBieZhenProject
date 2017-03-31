package com.qubiezhen.services;

import com.qubiezhen.dao.dto.CartDto;
import com.qubiezhen.dao.factory.CartDaoFactory;

/**
 * Created by yangj on 2016/12/21.
 */
public class GetCartInfoService {
    /**
     * 查询购物车统计信息
     *
     * @param dto
     * @return
     */
    public static CartDto getCartCount(CartDto dto) {
        return CartDaoFactory.getCartDao().getCartCount(dto);
    }
}
