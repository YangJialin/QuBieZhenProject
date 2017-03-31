package com.qubiezhen.dao.impl;

import com.qubiezhen.common.DBUnit;
import com.qubiezhen.dao.GetUserInfoDao;
import com.qubiezhen.dao.dto.CityDto;
import com.qubiezhen.dao.dto.ProvinceDto;
import com.qubiezhen.dao.dto.UserDTO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by yangj on 2016/12/14.
 */
public class GetUserInfoDaoImpl implements GetUserInfoDao {
    final String SQL_GETPR = "SELECT * FROM PROVINCE";
    final String SQL_GETCT = "SELECT * FROM CITY WHERE PROVINCE_ID = ?";

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    List<ProvinceDto> prList = new ArrayList<>();
    List<CityDto> cityList = new ArrayList<>();
    List<UserDTO> userList = new ArrayList<>();


    @Override
    public List<ProvinceDto> getProvince() {
        conn = DBUnit.getConnetction();
        try {
            ps = conn.prepareStatement(SQL_GETPR);
            rs = ps.executeQuery();
            while (rs.next()) {
                ProvinceDto dto = new ProvinceDto();
                dto.setProvinceId(rs.getString("PROVINCE_ID"));
                dto.setPrivinceName(rs.getString("PROVINCE_NAME"));
                prList.add(dto);
            }
            if (prList != null) {
                return prList;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUnit.close(conn, ps, rs);
        }
        return null;
    }

    @Override
    public List<CityDto> getCitys(ProvinceDto dto) {
        conn = DBUnit.getConnetction();
        try {
            ps = conn.prepareStatement(SQL_GETCT);
            ps.setString(1, dto.getProvinceId());
            rs = ps.executeQuery();
            while (rs.next()) {
                CityDto cityDto = new CityDto();
                cityDto.setCityId(rs.getString("CITY_ID"));
                cityDto.setCityName(rs.getString("CITY_NAME"));
                cityList.add(cityDto);
            }
            if (cityList != null) {
                return cityList;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUnit.close(conn, ps, rs);
        }
        return null;

    }

    @Override
    public List<UserDTO> getUserInfo(UserDTO udto) {
        conn = DBUnit.getConnetction();
        String sql = "SELECT * FROM MARKET_USERS WHERE 1=1 ";
        if (!"".equals(udto.getEmail()) && udto.getEmail() != null) {
            sql += " AND EMAIL=" + "'" + udto.getEmail() + "'";
        }
        if (!"".equals(udto.getUserName()) && udto.getUserName() != null) {
            sql += " AND USER_NAME = " + "'" + udto.getUserName() + "'";
        }
        if (!"".equals(udto.getShowName()) && udto.getShowName() != null) {
            sql += " AND SHOW_NAME = " + "'" + udto.getShowName() + "'";
        }
        if (!"".equals(udto.getMobile()) && udto.getMobile() != null) {
            sql += " AND MOBILE = " + "'" + udto.getMobile() + "'";
        }
        if (!"".equals(udto.getSex()) && udto.getSex() != null) {
            sql += " AND SEX = " + "'" + udto.getSex() + "'";
        }
        if (!"".equals(udto.getBirthday()) && udto.getBirthday() != null) {
            sql += " AND BIRTHDAY = " + "'" + udto.getBirthday() + "'";
        }
        if (!"".equals(udto.getProvince()) && udto.getProvince() != null) {
            sql += " AND PROVINCE = " + "'" + udto.getProvince() + "'";
        }
        if (!"".equals(udto.getCity()) && udto.getCity() != null) {
            sql += " AND CITY = " + "'" + udto.getCity() + "'";
        }
        if (!"".equals(udto.getIsAuthentication()) && udto.getIsAuthentication() != null) {
            sql += " AND IS_AUTHENTICATION = " + "'" + udto.getIsAuthentication() + "'";
        }
        if (!"".equals(udto.getIsAvalible()) && udto.getIsAvalible() != null) {
            sql += " AND IS_AVALIBLE = " + "'" + udto.getIsAvalible() + "'";
        }

        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                UserDTO tempUdto = new UserDTO();
                tempUdto.setUserId(rs.getInt("USER_ID"));
                tempUdto.setMobile(rs.getString("MOBILE"));
                tempUdto.setEmail(rs.getString("EMAIL"));
                tempUdto.setUserName(rs.getString("USER_NAME"));
                tempUdto.setShowName(rs.getString("SHOW_NAME"));
                tempUdto.setSex(rs.getInt("SEX"));
                tempUdto.setBirthday(rs.getDate("BIRTHDAY"));
                tempUdto.setCreateTime(rs.getDate("CREATE_TIME"));
                tempUdto.setScore(rs.getInt("SCORE"));
                tempUdto.setProvince(rs.getString("PROVINCE"));
                tempUdto.setCity(rs.getString("CITY"));
                tempUdto.setAddress(rs.getString("ADDRESS"));
                tempUdto.setIsAuthentication(rs.getInt("IS_AUTHENTICATION"));
                tempUdto.setIsAvalible(rs.getInt("IS_AVALIBLE"));
                tempUdto.setPicImg(rs.getString("PIC_IMG"));
                userList.add(tempUdto);
            }
            if (userList != null) {
                return userList;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUnit.close(conn, ps, rs);
        }
        return null;
    }

    @Override
    public UserDTO getUserInfoById(UserDTO udto) {
        conn = DBUnit.getConnetction();
        String sql = "SELECT" +
                "  user_id," +
                "  MOBILE," +
                "  EMAIL," +
                "  PASSWORD," +
                "  USER_NAME," +
                "  SHOW_NAME," +
                "  SEX," +
                "  birthday," +
                "  CREATE_TIME," +
                "  score," +
                "  address," +
                "  IS_authentication," +
                "  IS_AVALIBLE," +
                "  PIC_IMG," +
                "  MSG_NUM," +
                "  province_name," +
                "  city_name " +
                "FROM MARKET_USERS AS u JOIN province AS p ON u.province = p.province_id JOIN city AS ci ON u.city = ci.city_id " +
                "WHERE user_id = ?";
        try {

            if (!"".equals(udto.getUserId()) && udto.getUserId() != null) {
                ps = conn.prepareStatement(sql);
                ps.setInt(1, udto.getUserId());
            } else {
                return null;
            }
            rs = ps.executeQuery();
            if (rs.next()) {
                UserDTO tempUdto = new UserDTO();
                tempUdto.setUserId(rs.getInt("USER_ID"));
                tempUdto.setMobile(rs.getString("MOBILE"));
                tempUdto.setEmail(rs.getString("EMAIL"));
                tempUdto.setUserName(rs.getString("USER_NAME"));
                tempUdto.setShowName(rs.getString("SHOW_NAME"));
                tempUdto.setSex(rs.getInt("SEX"));
                tempUdto.setBirthday(rs.getDate("BIRTHDAY"));
                tempUdto.setCreateTime(rs.getDate("CREATE_TIME"));
                tempUdto.setScore(rs.getInt("SCORE"));
                tempUdto.setProvince(rs.getString("province_name"));
                tempUdto.setCity(rs.getString("city_name"));
                tempUdto.setAddress(rs.getString("ADDRESS"));
                tempUdto.setIsAuthentication(rs.getInt("IS_AUTHENTICATION"));
                tempUdto.setIsAvalible(rs.getInt("IS_AVALIBLE"));
                tempUdto.setPicImg(rs.getString("PIC_IMG"));
                return tempUdto;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUnit.close(conn, ps, rs);
        }
        return null;
    }

    @Override
    public UserDTO queryUserSellBuyCount(UserDTO udto) {
        conn = DBUnit.getConnetction();
        String sql = "SELECT COUNT(*) FROM orders WHERE user_id = ?";
        String sql2 = "SELECT COUNT(*) FROM secend_hand_goods WHERE author_id = ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, udto.getUserId());
            rs = ps.executeQuery();
            UserDTO tempudto = new UserDTO();
            if (rs.next()) {
                tempudto.setCountBuy(rs.getInt("COUNT(*)"));
            }
            ps.clearParameters();
            rs.close();
            ps = conn.prepareStatement(sql2);
            ps.setInt(1, udto.getUserId());
            rs = ps.executeQuery();
            if (rs.next()) {
                tempudto.setCountSell(rs.getInt("COUNT(*)"));
            }
            return tempudto;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public Map getCount() {
        conn = DBUnit.getConnetction();
        String sql1 = "select count(*) from market_users";
        String sql2 = "select count(*) from secend_hand_goods";
        String sql3 = "select count(*) from orders";
        Map map = new HashMap();
        try {
            ps = conn.prepareStatement(sql1);
            rs = ps.executeQuery();
            if (rs.next()) {
                map.put("uc", rs.getInt("count(*)"));
            }
            ps = conn.prepareStatement(sql2);
            rs = ps.executeQuery();
            if (rs.next()) {
                map.put("sc", rs.getInt("count(*)"));
            }
            ps = conn.prepareStatement(sql3);
            rs = ps.executeQuery();
            if (rs.next()) {
                map.put("oc", rs.getInt("count(*)"));
            }
            return map;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
