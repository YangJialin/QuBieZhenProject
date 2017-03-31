package com.qubiezhen.dao.impl;

import com.qubiezhen.common.DBUnit;
import com.qubiezhen.dao.GoodsTypeDao;
import com.qubiezhen.dao.dto.GoodsTypeDto;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by yangj on 2016/12/18.
 */
public class GoodsTypeDaoImpl implements GoodsTypeDao {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    List<GoodsTypeDto> list;

    @Override
    public List<GoodsTypeDto> getGoodsType() {
        conn = DBUnit.getConnetction();
        String sql = "SELECT * FROM GOODS_TYPE";
        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            list = new ArrayList<>();
            while (rs.next()) {
                GoodsTypeDto gtdto = new GoodsTypeDto();
                gtdto.setTypeId(rs.getString("TYPE_ID"));
                gtdto.setTypeName(rs.getString("TYPE_NAME"));
                list.add(gtdto);
            }
            if (list != null) {
                return list;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUnit.close(conn, ps, rs);
        }

        return null;
    }
}
