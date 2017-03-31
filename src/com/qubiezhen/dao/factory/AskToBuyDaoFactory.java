package com.qubiezhen.dao.factory;

import com.qubiezhen.dao.AskToBuyDao;
import com.qubiezhen.dao.impl.AskToBuyDaoImpl;

/**
 * Created by yangj on 2016/12/28.
 */
public class AskToBuyDaoFactory {
    public static AskToBuyDao getAskToBuyDao() {
        return new AskToBuyDaoImpl();
    }
}
