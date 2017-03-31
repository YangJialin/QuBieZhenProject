package com.qubiezhen.dao.factory;

import com.qubiezhen.dao.GoodsTypeDao;
import com.qubiezhen.dao.impl.GoodsTypeDaoImpl;

/**
 * Created by yangj on 2016/12/18.
 */
public class GoodsTypeDaoFactory {
    public static GoodsTypeDao getGoodsTypeDao() {
        return new GoodsTypeDaoImpl();
    }
}
