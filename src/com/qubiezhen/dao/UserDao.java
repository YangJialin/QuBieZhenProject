package com.qubiezhen.dao;

import com.qubiezhen.dao.dto.UserDTO;

/**
 * Created by yangj on 2016/12/6.
 */
public interface UserDao {
    UserDTO UserLogin(UserDTO udto);

    Integer UserRegister(UserDTO udto);

    boolean AddUser(UserDTO udto);

    boolean ModifyUser(UserDTO udto);

    boolean DeleteUser(UserDTO udto);
}
