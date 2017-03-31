package com.qubiezhen.dao.factory;

import com.qubiezhen.dao.UserDao;
import com.qubiezhen.dao.impl.UserDaoImpl;

/**
 * Created by yangj on 2016/12/6.
 */
public class UserDaoFactory {

    public static UserDao getUserDao() {
        return new UserDaoImpl();
    }
}
