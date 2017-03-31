package com.qubiezhen.dao.impl;

import com.qubiezhen.common.DBUnit;
import com.qubiezhen.dao.LeaveMessageDao;
import com.qubiezhen.dao.dto.LeaveMessageDto;
import com.qubiezhen.dao.dto.UserDTO;
import com.qubiezhen.services.GetUserInfoService;
import com.qubiezhen.services.UserService;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by yangj on 2016/12/24.
 */
public class LeaveMessageDaoImpl implements LeaveMessageDao {
    Connection conn;
    PreparedStatement ps;
    ResultSet rs;
    String SQL_ADD = "INSERT INTO LEAVE_MESSAGES(GOODS_ID,CREATE_TIME,MARKET_USER_ID,MESSAGE_DETAILS)" +
            " VALUES(?,NOW(),?,?)";
    String SQL_GET = "SELECT * FROM LEAVE_MESSAGES WHERE GOODS_ID = ?";

    @Override
    public Boolean addLeaveMessage(LeaveMessageDto msgdto) {
        conn = DBUnit.getConnetction();
        try {
            ps = conn.prepareStatement(SQL_ADD);
            ps.setInt(1, msgdto.getGoodsId());
            ps.setInt(2, msgdto.getMarketUserId());
            ps.setString(3, msgdto.getMessageDetails());

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
    public List<LeaveMessageDto> getLeaveMessageList(LeaveMessageDto msgdto) {
        conn = DBUnit.getConnetction();
        List<LeaveMessageDto> list = new ArrayList<>();
        try {
            ps = conn.prepareStatement(SQL_GET);
            ps.setInt(1, msgdto.getGoodsId());
            rs = ps.executeQuery();
            while (rs.next()) {
                LeaveMessageDto tempdto = new LeaveMessageDto();
                tempdto.setLeaveMessageId(rs.getInt("LEAVE_MESSAGE_ID"));
                tempdto.setGoodsId(rs.getInt("GOODS_ID"));
                tempdto.setCreateTime(rs.getDate("CREATE_TIME"));
                tempdto.setMarketUserId(rs.getInt("MARKET_USER_ID"));
                tempdto.setMessageDetails(rs.getString("MESSAGE_DETAILS"));
                UserDTO udto = new UserDTO();
                udto.setUserId(rs.getInt("MARKET_USER_ID"));
                tempdto.setUdto(GetUserInfoService.getUserInfoById(udto));
                list.add(tempdto);
            }
            if (list.size() > 0) {
                return list;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }
}
