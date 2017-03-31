package com.qubiezhen.dao.factory;

import com.qubiezhen.dao.CartDao;
import com.qubiezhen.dao.impl.CartDaoImpl;

/**
 * Created by yangj on 2016/12/21.
 */
public class CartDaoFactory {
    public static CartDao getCartDao() {
        return new CartDaoImpl();
    }

}
