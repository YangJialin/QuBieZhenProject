package com.qubiezhen.dao.impl;

import com.qubiezhen.common.DBUnit;
import com.qubiezhen.dao.NoticeDao;
import com.qubiezhen.dao.dto.NoticeDto;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by yangj on 2016/12/26.
 */
public class NoticeDaoImpl implements NoticeDao {
    Connection conn;
    PreparedStatement ps;
    ResultSet rs;

    @Override
    public Boolean addNotice(NoticeDto ndto) {
        conn = DBUnit.getConnetction();
        String SQL = "INSERT INTO NOTICE(NOTICE_TITLE,NOTICE_DETAILS,NOTICE_IMG,CREATE_ADMIN_ID,CREATE_TIME)" +
                " VALUES (?,?,?,?,NOW())";
        try {
            ps = conn.prepareStatement(SQL);
            ps.setString(1, ndto.getNoticeTitle());
            ps.setString(2, ndto.getNoticeDetails());
            ps.setString(3, ndto.getNoticeImg());
            ps.setInt(4, ndto.getCreateAdminId());
            int i = ps.executeUpdate();
            if (i > 0) {
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public Boolean modifyNotice(NoticeDto ndto) {
        conn = DBUnit.getConnetction();
        String SQL = "UPDATE NOTICE SET NOTICE_TITLE=?,NOTICE_DETAILS=? WHERE NOTICE_ID = ?";
        try {
            ps = conn.prepareStatement(SQL);
            ps.setString(1, ndto.getNoticeTitle());
            ps.setString(2, ndto.getNoticeDetails());
            ps.setInt(2, ndto.getCreateAdminId());

            int i = ps.executeUpdate();
            if (i > 0) {
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<NoticeDto> getNoticeList(NoticeDto ndto) {
        conn = DBUnit.getConnetction();
        String SQL = "SELECT NOTICE_ID,NOTICE_TITLE,CREATE_ADMIN_ID,CREATE_TIME " +
                "FROM NOTICE " +
                "WHERE 1=1 ";
        if (ndto.getNoticeId() != null && !"".equals(ndto.getNoticeId())) {
            SQL += "AND NOTICE_ID = " + ndto.getNoticeId();
        }
        if (ndto.getNoticeTitle() != null && !"".equals(ndto.getNoticeTitle())) {
            SQL += "AND NOTICE_TITLE LIKE '%" + ndto.getNoticeTitle() + "%'";
        }
        if (ndto.getCreateTimeLow() != null && !"".equals(ndto.getCreateTimeLow()) && ndto.getCreateTimeHigh() == null && "".equals(ndto.getCreateTimeHigh())) {
            SQL += "AND CREATE_TIME > " + ndto.getCreateTimeLow();
        }
        if (ndto.getCreateTimeLow() == null && "".equals(ndto.getCreateTimeLow()) && ndto.getCreateTimeHigh() != null && !"".equals(ndto.getCreateTimeHigh())) {
            SQL += "AND CREATE_TIME < " + ndto.getCreateTimeHigh();
        }
        if (ndto.getCreateTimeLow() != null && !"".equals(ndto.getCreateTimeLow()) && ndto.getCreateTimeHigh() != null && !"".equals(ndto.getCreateTimeHigh())) {
            SQL += "AND CREATE_TIME BETWEEN " + ndto.getCreateTimeLow() + " AND " + ndto.getCreateTimeHigh();
        }
        try {
            ps = conn.prepareStatement(SQL);
            rs = ps.executeQuery();
            List<NoticeDto> list = new ArrayList<>();
            while (rs.next()) {
                NoticeDto noticeDto = new NoticeDto();
                noticeDto.setNoticeId(rs.getInt("NOTICE_ID"));
                noticeDto.setNoticeTitle(rs.getString("NOTICE_TITLE"));
                noticeDto.setCreateAdminId(rs.getInt("CREATE_ADMIN_ID"));
                noticeDto.setCreateTime(rs.getDate("CREATE_TIME"));
                list.add(noticeDto);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUnit.close(conn, ps, rs);
        }
        return null;
    }

    @Override
    public NoticeDto getNoticeById(NoticeDto ndto) {
        conn = DBUnit.getConnetction();
        String SQL = "SELECT * FROM NOTICE " +
                "WHERE NOTICE_ID=?";
        try {
            ps = conn.prepareStatement(SQL);
            ps.setInt(1, ndto.getNoticeId());
            rs = ps.executeQuery();
            if (rs.next()) {
                NoticeDto noticeDto = new NoticeDto();
                noticeDto.setNoticeId(rs.getInt("NOTICE_ID"));
                noticeDto.setNoticeTitle(rs.getString("NOTICE_TITLE"));
                noticeDto.setNoticeDetails(rs.getString("NOTICE_DETAILS"));
                noticeDto.setCreateTime(rs.getDate("CREATE_TIME"));
                noticeDto.setCreateAdminId(rs.getInt("CREATE_ADMIN_ID"));
                return noticeDto;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public Boolean deleteNotice(NoticeDto ndto) {
        conn = DBUnit.getConnetction();
        String SQL = "DELETE FROM NOTICE" +
                " WHERE NOTICE_ID=?";
        try {
            ps = conn.prepareStatement(SQL);
            ps.setInt(1, ndto.getNoticeId());

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
