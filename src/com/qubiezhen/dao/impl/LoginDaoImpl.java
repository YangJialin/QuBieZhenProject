package com.qubiezhen.dao.impl;

import com.qubiezhen.dao.LoginDao;
import com.qubiezhen.dao.dto.AdminDto;
import com.qubiezhen.common.DBUnit;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by yangj on 2016/12/12.
 */
public class LoginDaoImpl implements LoginDao {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    final static String SQL_LOGIN = "SELECT * FROM ADMIN WHERE ADMIN_EMAIL=? AND ADMIN_PASSWORD = ?";
    final static String SQL_UPTIME = "UPDATE admin SET ADMIN.last_login_time = SYSDATE();";

    @Override
    public AdminDto adminLogin(AdminDto admindto) {
        conn = DBUnit.getConnetction();
        try {
            ps = conn.prepareStatement(SQL_LOGIN);
            ps.setString(1, admindto.getAdminEmail());
            ps.setString(2, admindto.getAdminPassword());
            rs = ps.executeQuery();
            if (rs.next()) {
                AdminDto returnDto = new AdminDto();
                returnDto.setAdminId(rs.getInt("ADMIN_ID"));
                returnDto.setAdminName(rs.getString("ADMIN_NAME"));
                System.out.println(returnDto.getAdminName());
                returnDto.setAdminPassword(rs.getString("ADMIN_PASSWORD"));
                returnDto.setAdminType(rs.getInt("ADMIN_TYPE"));
                returnDto.setAdminEmail(rs.getString("ADMIN_EMAIL"));
                returnDto.setLastLoginTime(rs.getDate("LAST_LOGIN_TIME"));
                if (updateLoginTime() > 0)
                    return returnDto;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUnit.close(conn, ps, rs);
        }

        return null;
    }

    public int updateLoginTime() {
        conn = DBUnit.getConnetction();
        try {
            ps = conn.prepareStatement(SQL_UPTIME);
            int i = ps.executeUpdate();
            if (i > 0) {
                return i;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return 0;
    }
}
