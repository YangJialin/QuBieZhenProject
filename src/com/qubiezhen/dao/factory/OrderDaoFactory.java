package com.qubiezhen.dao.factory;

import com.qubiezhen.dao.OrderDao;
import com.qubiezhen.dao.impl.OrderDaoImpl;

/**
 * Created by yangj on 2016/12/22.
 */
public class OrderDaoFactory {
    public static OrderDao getOrderDao() {
        return new OrderDaoImpl();
    }
}
