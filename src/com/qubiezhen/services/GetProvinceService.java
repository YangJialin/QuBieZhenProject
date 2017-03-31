package com.qubiezhen.services;

import com.qubiezhen.dao.GetUserInfoDao;
import com.qubiezhen.dao.dto.CityDto;
import com.qubiezhen.dao.dto.ProvinceDto;
import com.qubiezhen.dao.factory.GetUserInfoFactory;
import com.qubiezhen.dao.impl.GetUserInfoDaoImpl;

import java.util.List;

/**
 * Created by yangj on 2016/12/14.
 */
public class GetProvinceService {
    public static List<ProvinceDto> getProvinceList() {
        List<ProvinceDto> prList = GetUserInfoFactory.getUserInfoDao().getProvince();
        if (prList != null) {
            return prList;
        }
        return null;
    }
}
