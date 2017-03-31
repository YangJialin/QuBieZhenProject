package com.qubiezhen.actions;

import com.opensymphony.xwork2.ActionSupport;
import com.qubiezhen.dao.dto.GoodsTypeDto;
import com.qubiezhen.dao.dto.UserDTO;
import com.qubiezhen.dao.factory.GetUserInfoFactory;
import com.qubiezhen.services.GetCityService;
import com.qubiezhen.services.GetGoodsTypeService;
import com.qubiezhen.services.GetProvinceService;
import com.qubiezhen.dao.dto.CityDto;
import com.qubiezhen.dao.dto.ProvinceDto;
import com.qubiezhen.services.GetUserInfoService;

import java.util.List;
import java.util.Map;

/**
 * Created by yangj on 2016/12/14.
 */
public class getInfoAction extends ActionSupport {
    private List<ProvinceDto> provinceList = null;
    private List<CityDto> cityList = null;
    private List<UserDTO> userList = null;
    private List<GoodsTypeDto> goodsTypeList = null;
    private ProvinceDto prdto = null;
    private UserDTO udto = null;
    private Map countMap;

    public List<UserDTO> getUserList() {
        return userList;
    }

    public void setUserList(List<UserDTO> userList) {
        this.userList = userList;
    }

    public UserDTO getUdto() {
        return udto;
    }

    public void setUdto(UserDTO udto) {
        this.udto = udto;
    }

    public List<ProvinceDto> getProvinceList() {
        return provinceList;
    }

    public void setProvinceList(List<ProvinceDto> provinceList) {
        this.provinceList = provinceList;
    }

    public List<CityDto> getCityList() {
        return cityList;
    }

    public void setCityList(List<CityDto> cityList) {
        this.cityList = cityList;
    }

    public ProvinceDto getPrdto() {
        return prdto;
    }

    public void setPrdto(ProvinceDto prdto) {
        this.prdto = prdto;
    }

    public String queryProvince() {//不能用get·
        List<ProvinceDto> prList = GetProvinceService.getProvinceList();
        if (prList != null) {
            this.provinceList = prList;
            System.out.print(prList.get(0).getPrivinceName());
            return SUCCESS;
        }
        return ERROR;
    }

    public String queryCitys() {
        System.out.print("执行了getcitys");
        List<CityDto> cityList = GetCityService.getCityList(prdto);
        if (cityList != null) {
            this.cityList = cityList;
            return SUCCESS;
        }
        return ERROR;
    }

    public String queryGoodsType() {
        List<GoodsTypeDto> tempList = GetGoodsTypeService.getGoodsType();
        if (tempList != null) {
            this.goodsTypeList = tempList;
            return SUCCESS;
        }
        return ERROR;
    }


    public String queryUserInfo() {
        this.userList = GetUserInfoService.getUserInfo(udto);
        if (userList != null) {
            return SUCCESS;
        }
        return ERROR;
    }

    public String queryUserInfoById() {
        System.out.println(udto.getUserId());
        UserDTO udtoTemp = GetUserInfoService.getUserInfoById(udto);
        if (udtoTemp != null) {
            this.udto = udtoTemp;
            return SUCCESS;
        }
        return ERROR;
    }

    public String queryUserSellBuyCount() {

        UserDTO udtoTemp = GetUserInfoService.queryUserSellBuyCount(udto);
        if (udtoTemp != null) {
            this.udto = udtoTemp;
            return SUCCESS;
        }
        return ERROR;
    }

    public String getCount() {
        Map tempmap = GetUserInfoFactory.getUserInfoDao().getCount();
        if (tempmap.size() > 0) {
            this.countMap = tempmap;
            return SUCCESS;
        }
        return ERROR;
    }

    public List<GoodsTypeDto> getGoodsTypeList() {
        return goodsTypeList;
    }

    public void setGoodsTypeList(List<GoodsTypeDto> goodsTypeList) {
        this.goodsTypeList = goodsTypeList;
    }

    public Map getCountMap() {
        return countMap;
    }

    public void setCountMap(Map countMap) {
        this.countMap = countMap;
    }
}
