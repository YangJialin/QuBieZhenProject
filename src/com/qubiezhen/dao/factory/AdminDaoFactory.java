package com.qubiezhen.dao.factory;


import com.qubiezhen.dao.LoginDao;
import com.qubiezhen.dao.impl.LoginDaoImpl;

/**
 * Created by yangj on 2016/12/6.
 */
public class AdminDaoFactory {

    public static LoginDao getLoginDao() {
        return new LoginDaoImpl();
    }
}
