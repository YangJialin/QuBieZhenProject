package com.qubiezhen.services;

import com.qubiezhen.dao.GetUserInfoDao;
import com.qubiezhen.dao.dto.CityDto;
import com.qubiezhen.dao.dto.ProvinceDto;
import com.qubiezhen.dao.impl.GetUserInfoDaoImpl;

import java.util.List;

/**
 * Created by yangj on 2016/12/15.
 */
public class GetCityService {

    public static List<CityDto> getCityList(ProvinceDto dto) {
        GetUserInfoDao getUserInfoDao = new GetUserInfoDaoImpl();
        List<CityDto> cityList = getUserInfoDao.getCitys(dto);
        if (cityList != null) {
            return cityList;
        }
        return null;
    }
}
