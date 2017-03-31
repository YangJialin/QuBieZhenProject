package com.qubiezhen.dao.impl;

import com.qubiezhen.common.DBUnit;
import com.qubiezhen.dao.AskToBuyDao;
import com.qubiezhen.dao.dto.AskToBuyDto;
import com.qubiezhen.dao.dto.UserDTO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by yangj on 2016/12/28.
 */
public class AskToBuyDaoImpl implements AskToBuyDao {

    Connection conn;
    PreparedStatement ps;
    ResultSet rs;

    @Override
    public Boolean addAskToBuy(AskToBuyDto askdto) {
        conn = DBUnit.getConnetction();
        String sql = "INSERT INTO ASK_TO_BUY(USER_ID,ASK_IMG,ASK_TITLE,ASK_DETAILS,CREATE_TIME) " +
                "VALUES(?,?,?,?,NOW())";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, askdto.getUdto().getUserId());
            ps.setString(2, askdto.getAskImg());
            ps.setString(3, askdto.getAskTitle());
            ps.setString(4, askdto.getAskDetails());
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
    public List<AskToBuyDto> getAskToBuyList(AskToBuyDto askdto) {
        conn = DBUnit.getConnetction();
        String sql = "SELECT" +
                "  ask_id," +
                "  ask_details," +
                "  ask_title," +
                "  a.create_time," +
                "  u.user_id," +
                "  MOBILE," +
                "  EMAIL," +
                "  PASSWORD," +
                "  USER_NAME," +
                "  SHOW_NAME," +
                "  SEX," +
                "  birthday," +
                "  score," +
                "  city," +
                "  province," +
                "  address," +
                "  PIC_IMG " +
                "FROM ask_to_buy a JOIN market_users u ON a.user_id = u.user_id WHERE 1=1 ";
        if (askdto.getAskTitle() != null && !"".equals(askdto.getAskTitle())) {
            sql += " AND ASK_TITLE LIKE '%" + askdto.getAskTitle() + "%'";
        }
        if (askdto.getUserId() != null && !"".equals(askdto.getUserId())) {
            sql += " AND u.user_id = " + askdto.getUserId();
        }
        System.out.println(sql);
        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            List<AskToBuyDto> tempList = new ArrayList<>();
            while (rs.next()) {
                AskToBuyDto temp = new AskToBuyDto();
                temp.setAskId(rs.getInt("ASK_ID"));
                temp.setCreateTime(rs.getTimestamp("a.create_time"));
                temp.setAskDetails(rs.getString("ask_details"));
                temp.setAskTitle(rs.getString("ask_title"));
                UserDTO tempu = new UserDTO();
                tempu.setUserId(rs.getInt("u.user_id"));
                tempu.setAddress(rs.getString("ADDRESS"));
                tempu.setMobile(rs.getString("MOBILE"));
                tempu.setEmail(rs.getString("EMAIL"));
                tempu.setUserName(rs.getString("USER_NAME"));
                tempu.setShowName(rs.getString("SHOW_NAME"));
                tempu.setSex(rs.getInt("SEX"));
                tempu.setBirthday(rs.getDate("BIRTHDAY"));
                tempu.setScore(rs.getInt("SCORE"));
                tempu.setCity(rs.getString("CITY"));
                tempu.setProvince(rs.getString("PROVINCE"));
                tempu.setPicImg(rs.getString("PIC_IMG"));
                temp.setUdto(tempu);
                tempList.add(temp);
            }
            return tempList;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUnit.close(conn, ps, rs);
        }

        return null;
    }

    @Override
    public AskToBuyDto getAskToBuyDetails(AskToBuyDto askdto) {
        conn = DBUnit.getConnetction();
        String sql = "SELECT" +
                "  ask_id," +
                "  ask_details," +
                "  ask_title," +
                "  a.create_time," +
                "  u.user_id," +
                "  MOBILE," +
                "  EMAIL," +
                "  PASSWORD," +
                "  USER_NAME," +
                "  SHOW_NAME," +
                "  SEX," +
                "  birthday," +
                "  score," +
                "  city," +
                "  province," +
                "  address," +
                "  PIC_IMG " +
                "FROM ask_to_buy a JOIN market_users u ON a.user_id = u.user_id WHERE ask_id = ? ";


        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, askdto.getAskId());
            rs = ps.executeQuery();
            if (rs.next()) {
                AskToBuyDto temp = new AskToBuyDto();
                temp.setAskId(rs.getInt("ASK_ID"));
                temp.setCreateTime(rs.getTimestamp("a.create_time"));

                temp.setAskDetails(rs.getString("ask_details"));
                temp.setAskTitle(rs.getString("ask_title"));
                UserDTO tempu = new UserDTO();
                tempu.setUserId(rs.getInt("u.user_id"));
                tempu.setAddress(rs.getString("ADDRESS"));
                tempu.setMobile(rs.getString("MOBILE"));
                tempu.setEmail(rs.getString("EMAIL"));
                tempu.setUserName(rs.getString("USER_NAME"));
                tempu.setShowName(rs.getString("SHOW_NAME"));
                tempu.setSex(rs.getInt("SEX"));
                tempu.setBirthday(rs.getDate("BIRTHDAY"));
                tempu.setScore(rs.getInt("SCORE"));
                tempu.setCity(rs.getString("CITY"));
                tempu.setProvince(rs.getString("PROVINCE"));
                tempu.setPicImg(rs.getString("PIC_IMG"));
                temp.setUdto(tempu);
                return temp;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUnit.close(conn, ps, rs);
        }

        return null;
    }
}
