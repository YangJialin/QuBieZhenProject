package com.qubiezhen.services;

import com.qubiezhen.dao.dto.UserDTO;
import com.qubiezhen.dao.factory.GetUserInfoFactory;

import java.util.List;

/**
 * Created by yangj on 2016/12/16.
 */
public class GetUserInfoService {
    public static List<UserDTO> getUserInfo(UserDTO udto) {
        return GetUserInfoFactory.getUserInfoDao().getUserInfo(udto);
    }

    public static UserDTO getUserInfoById(UserDTO udto) {
        return GetUserInfoFactory.getUserInfoDao().getUserInfoById(udto);
    }

    public static UserDTO queryUserSellBuyCount(UserDTO udto) {
        return GetUserInfoFactory.getUserInfoDao().queryUserSellBuyCount(udto);
    }
}
