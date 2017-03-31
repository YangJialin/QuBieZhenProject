package com.qubiezhen.services;

import com.qubiezhen.dao.UserDao;
import com.qubiezhen.dao.dto.UserDTO;
import com.qubiezhen.dao.factory.UserDaoFactory;

/**
 * Created by yangj on 2016/12/6.
 */
public class UserService {
    public static UserDTO loginService(UserDTO udto) {
        UserDao udao = UserDaoFactory.getUserDao();
        if (udao != null) {
            return udao.UserLogin(udto);
        }
        return null;
    }

    public static int registerService(UserDTO udto) {
        UserDao udao = UserDaoFactory.getUserDao();
        return udao.UserRegister(udto);
    }

    public static boolean addUserService(UserDTO udto) {
        return UserDaoFactory.getUserDao().AddUser(udto);
    }

    public static boolean modifyUserService(UserDTO udto) {
        return UserDaoFactory.getUserDao().ModifyUser(udto);
    }

    public static boolean deleteUserService(UserDTO udto) {
        return UserDaoFactory.getUserDao().DeleteUser(udto);
    }
}
