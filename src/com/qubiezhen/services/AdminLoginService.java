package com.qubiezhen.services;


import com.qubiezhen.dao.LoginDao;
import com.qubiezhen.dao.dto.AdminDto;
import com.qubiezhen.dao.factory.AdminDaoFactory;

/**
 * Created by yangj on 2016/12/6.
 */
public class AdminLoginService {
    public static AdminDto loginService(AdminDto adminDto) {
        LoginDao loginDao = AdminDaoFactory.getLoginDao();
        AdminDto adto = loginDao.adminLogin(adminDto);
        if (adto != null) {
            return adto;
        }
        return null;
    }

}
