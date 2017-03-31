package com.qubiezhen.dao.factory;

import com.qubiezhen.dao.GetUserInfoDao;
import com.qubiezhen.dao.dto.ProvinceDto;
import com.qubiezhen.dao.impl.GetUserInfoDaoImpl;

import java.util.List;

/**
 * Created by yangj on 2016/12/14.
 */
public class GetUserInfoFactory {
    public static GetUserInfoDao getUserInfoDao() {
        return new GetUserInfoDaoImpl();
    }
}
