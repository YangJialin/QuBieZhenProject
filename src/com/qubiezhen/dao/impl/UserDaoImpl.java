package com.qubiezhen.dao.impl;

import com.qubiezhen.common.DBUnit;
import com.qubiezhen.dao.UserDao;
import com.qubiezhen.dao.dto.UserDTO;

import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.Date;

/**
 * Created by yangj on 2016/12/6.
 */
public class UserDaoImpl implements UserDao {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    final static String SQL_LOGIN = "SELECT * FROM MARKET_USERS WHERE EMAIL = ? AND PASSWORD = ?";
    final static String SQL_REGSTER = "INSERT INTO MARKET_USERS(`USER_NAME`,`EMAIL`,`PASSWORD`) VALUES(?,?,?);";
    final static String SQL_ADDUSER = "INSERT INTO market_users(MOBILE,EMAIL,PASSWORD,USER_NAME,SHOW_NAME,SEX,birthday," +
            "CREATE_TIME,score,city,province,address,IS_authentication,IS_AVALIBLE,PIC_IMG) " +
            "VALUES (?,?,?,?,?,?,?,NOW(),?,?,?,?,?,?,?);";
    final static String SQL_DELETEUSER = "DELETE FROM MARKET_USERS WHERE USER_ID = ?";

    @Override
    public UserDTO UserLogin(UserDTO udto) {
        conn = DBUnit.getConnetction();

        try {
            ps = conn.prepareStatement(SQL_LOGIN);
            if (!"".equals(udto.getEmail()) && udto.getEmail() != null &&
                    !"".equals(udto.getPassword()) && udto.getPassword() != null) {
                ps.setString(1, udto.getEmail());
                ps.setString(2, udto.getPassword());
            } else {
                return null;
            }

            rs = ps.executeQuery();
            if (rs.next()) {
                UserDTO resultUDTO = new UserDTO();
                resultUDTO.setUserId(rs.getInt("USER_ID"));
                resultUDTO.setAddress(rs.getString("ADDRESS"));
                resultUDTO.setMobile(rs.getString("MOBILE"));
                resultUDTO.setEmail(rs.getString("EMAIL"));
                resultUDTO.setUserName(rs.getString("USER_NAME"));
                resultUDTO.setShowName(rs.getString("SHOW_NAME"));
                resultUDTO.setSex(rs.getInt("SEX"));
//                resultUDTO.setBirthday(rs.getDate("BIRTHDAY"));
                resultUDTO.setBirthday(rs.getDate("BIRTHDAY"));
                resultUDTO.setCreateTime(rs.getDate("CREATE_TIME"));
                resultUDTO.setScore(rs.getInt("SCORE"));
                resultUDTO.setCity(rs.getString("CITY"));
                resultUDTO.setProvince(rs.getString("PROVINCE"));
                resultUDTO.setIsAuthentication(rs.getInt("IS_AUTHENTICATION"));
                resultUDTO.setIsAvalible(rs.getInt("IS_AVALIBLE"));
                resultUDTO.setPicImg(rs.getString("PIC_IMG"));
                resultUDTO.setMsgNum(rs.getInt("MSG_NUM"));
                return resultUDTO;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUnit.close(conn, ps, rs);
        }

        return null;
    }


    @Override
    public Integer UserRegister(UserDTO udto) {
        conn = DBUnit.getConnetction();
        try {
            ps = conn.prepareStatement(SQL_REGSTER);
            if (!"".equals(udto.getUserName()) && udto.getUserName() != null &&
                    !"".equals(udto.getEmail()) && udto.getEmail() != null &&
                    !"".equals(udto.getPassword()) && udto.getPassword() != null) {
                ps.setString(1, udto.getUserName());
                ps.setString(2, udto.getEmail());
                ps.setString(3, udto.getPassword());
            } else {
                return null;
            }
            return ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public boolean AddUser(UserDTO udto) {
        conn = DBUnit.getConnetction();
        try {
            ps = conn.prepareStatement(SQL_ADDUSER);
            ps.setString(1, udto.getMobile());
            ps.setString(2, udto.getEmail());
            ps.setString(3, udto.getPassword());
            ps.setString(4, udto.getUserName());
            ps.setString(5, udto.getShowName());
            ps.setInt(6, udto.getSex());
            ps.setDate(7, udto.getBirthday());
            ps.setInt(8, udto.getScore());
            ps.setString(9, udto.getCity());
            ps.setString(10, udto.getProvince());
            ps.setString(11, udto.getAddress());
            ps.setInt(12, udto.getIsAuthentication());
            ps.setInt(13, udto.getIsAvalible());
            ps.setString(14, udto.getPicImg());

            int i = ps.executeUpdate();
            if (i > 0) {
                return true;
            }


        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUnit.close(conn, ps, rs);
        }

        return false;
    }

    @Override
    public boolean ModifyUser(UserDTO udto) {
        conn = DBUnit.getConnetction();
        String sql1 = "UPDATE `market_users` SET `user_id`= ?";
        String sql2 = " WHERE `user_id`= ?";
        if (!"".equals(udto.getEmail()) && udto.getEmail() != null) {
            sql1 += ",EMAIL=" + "'" + udto.getEmail() + "'";
        }
        if (!"".equals(udto.getUserName()) && udto.getUserName() != null) {
            sql1 += ",USER_NAME = " + "'" + udto.getUserName() + "'";
        }
        if (!"".equals(udto.getShowName()) && udto.getShowName() != null) {
            sql1 += ",SHOW_NAME = " + "'" + udto.getShowName() + "'";
        }
        if (!"".equals(udto.getPassword()) && udto.getPassword() != null) {
            sql1 += ",PASSWORD = " + "'" + udto.getPassword() + "'";
        }
        if (!"".equals(udto.getMobile()) && udto.getMobile() != null) {
            sql1 += ",MOBILE = " + "'" + udto.getMobile() + "'";
        }
        if (!"".equals(udto.getSex()) && udto.getSex() != null) {
            sql1 += ",SEX = " + "'" + udto.getSex() + "'";
        }
        if (!"".equals(udto.getBirthday()) && udto.getBirthday() != null) {
            sql1 += ",BIRTHDAY = " + "'" + udto.getBirthday() + "'";
        }
        if (!"".equals(udto.getScore()) && udto.getScore() != null) {
            sql1 += ",SCORE = " + "'" + udto.getScore() + "'";
        }
        if (!"".equals(udto.getProvince()) && udto.getProvince() != null) {
            sql1 += ",PROVINCE = " + "'" + udto.getProvince() + "'";
        }
        if (!"".equals(udto.getCity()) && udto.getCity() != null) {
            sql1 += ",CITY = " + "'" + udto.getCity() + "'";
        }
        if (!"".equals(udto.getAddress()) && udto.getAddress() != null) {
            sql1 += ",ADDRESS = " + "'" + udto.getAddress() + "'";
        }
        if (!"".equals(udto.getIsAuthentication()) && udto.getIsAuthentication() != null) {
            sql1 += ",IS_AUTHENTICATION = " + "'" + udto.getIsAuthentication() + "'";
        }
        if (!"".equals(udto.getIsAvalible()) && udto.getIsAvalible() != null) {
            sql1 += ",IS_AVALIBLE = " + "'" + udto.getIsAvalible() + "'";
        }
        if (!"".equals(udto.getPicImg()) && udto.getPicImg() != null) {
            sql1 += ",PIC_IMG = " + "'" + udto.getPicImg() + "'";
        }
        String sql = sql1 + sql2;
        System.out.printf(sql);
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, udto.getUserId());
            ps.setInt(2, udto.getUserId());
            int i = ps.executeUpdate();

            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    @Override
    public boolean DeleteUser(UserDTO udto) {
        conn = DBUnit.getConnetction();
        try {
            ps = conn.prepareStatement(SQL_DELETEUSER);
            ps.setInt(1, udto.getUserId());
            int i = ps.executeUpdate();
            if (i > 0) {
                return true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUnit.close(conn, ps, rs);
        }
        return false;
    }
}
