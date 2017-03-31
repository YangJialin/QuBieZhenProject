package com.qubiezhen.dao.factory;

import com.qubiezhen.dao.SecendHandGoodsDao;
import com.qubiezhen.dao.impl.SecendHandGoodsDaoImpl;

/**
 * Created by yangj on 2016/12/18.
 */
public class SecendHandGoodsDaoFactory {
    public static SecendHandGoodsDao getSecendHandDao() {
        return new SecendHandGoodsDaoImpl();
    }
}
