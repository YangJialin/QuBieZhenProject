package com.qubiezhen.dao;

import com.qubiezhen.dao.dto.CityDto;
import com.qubiezhen.dao.dto.ProvinceDto;
import com.qubiezhen.dao.dto.UserDTO;

import java.util.List;
import java.util.Map;

/**
 * Created by yangj on 2016/12/14.
 */
public interface GetUserInfoDao {
    List<ProvinceDto> getProvince();

    List<CityDto> getCitys(ProvinceDto dto);

    List<UserDTO> getUserInfo(UserDTO udto);

    UserDTO getUserInfoById(UserDTO udto);

    UserDTO queryUserSellBuyCount(UserDTO udto);

    Map getCount();

}
