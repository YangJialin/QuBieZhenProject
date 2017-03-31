package com.qubiezhen.dao.impl;

import com.qubiezhen.common.DBUnit;
import com.qubiezhen.dao.SecendHandGoodsDao;
import com.qubiezhen.dao.dto.SecendHandGoodsDto;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by yangj on 2016/12/18.
 */
public class SecendHandGoodsDaoImpl implements SecendHandGoodsDao {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    List<SecendHandGoodsDto> list = null;
    String SQL_ADD = "INSERT INTO SECEND_HAND_GOODS(GOODS_TITLE,GOODS_DESCRIBE,GOODS_PRICE,AUTHOR_ID,CREATE_TIME,GOODS_IMG,GOODS_TYPE,GOODS_LOCATION,GOODS_STATUS) " +
            "VALUES(?,?,?,?,NOW(),?,?,?,?)";

    @Override
    public Boolean add2HandGoods(SecendHandGoodsDto sgdto) {
        conn = DBUnit.getConnetction();
        try {
            ps = conn.prepareStatement(SQL_ADD);
            ps.setString(1, sgdto.getGoodsTitle());
            ps.setString(2, sgdto.getGoodsDescribe());
            ps.setDouble(3, sgdto.getGoodsPrice());
            ps.setInt(4, sgdto.getAuthorId());
            ps.setString(5, sgdto.getGoodsImg());
            ps.setString(6, sgdto.getGoodsType());
            ps.setString(7, sgdto.getGoodsLocation());
            ps.setInt(8, sgdto.getGoodsStatus());
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
    public List<SecendHandGoodsDto> get2HandGoodsList(SecendHandGoodsDto sgdto) {
        conn = DBUnit.getConnetction();
        String SQL = "SELECT" +
                "  goods_id," +
                "  goods_title," +
                "  goods_describe," +
                "  goods_price," +
                "  author_id," +
                "  create_time," +
                "  goods_img," +
                "  type_name," +
                "  city_name," +
                "  province_name " +
                "FROM SECEND_HAND_GOODS sg " +
                "  JOIN goods_type t ON sg.goods_type = t.type_id " +
                "  JOIN city ON substring_index(sg.goods_location, '-', -1) = city_id " +
                "  JOIN province ON substring_index(sg.goods_location, '-', 1) = city.province_id WHERE 1=1 AND goods_status = 1 ";
        if (!"".equals(sgdto.getProvince()) && sgdto.getProvince() != null && !"".equals(sgdto.getCity()) && sgdto.getCity() != null) {
            SQL += "AND GOODS_LOCATION = " + "'" + sgdto.getProvince() + "-" + sgdto.getCity() + "'";
        } else if (!"".equals(sgdto.getProvince()) && sgdto.getProvince() != null) {
            SQL += "AND GOODS_LOCATION LIKE " + "'" + sgdto.getProvince() + "%'";
        }
        if (!"".equals(sgdto.getGoodsType()) && sgdto.getGoodsType() != null) {
            SQL += "AND GOODS_TYPE = " + "'" + sgdto.getGoodsType() + "'";
        }
        if (!"".equals(sgdto.getGoodsLocation()) && sgdto.getGoodsLocation() != null) {
            SQL += "AND GOODS_LOCATION LIKE " + "'%" + sgdto.getGoodsLocation() + "%'";
        }
        if (!"".equals(sgdto.getAuthorId()) && sgdto.getAuthorId() != null) {
            SQL += "AND AUTHOR_ID = " + "'" + sgdto.getAuthorId() + "'";
        }
        if (!"".equals(sgdto.getGoodsDescribe()) && sgdto.getGoodsDescribe() != null) {
            SQL += "AND GOODS_TITLE LIKE " + "'%" + sgdto.getGoodsDescribe() + "%' OR GOODS_DESCRIBE LIKE " + "'%" + sgdto.getGoodsDescribe() + "%'";
        }
        if (!"".equals(sgdto.getGoodsPriceLow()) && sgdto.getGoodsPriceLow() != null && !"".equals(sgdto.getGoodsPriceHigh()) && sgdto.getGoodsPriceHigh() != null) {
            SQL += "AND GOODS_PRICE BETWEEN " + sgdto.getGoodsPriceLow() + " AND " + sgdto.getGoodsPriceHigh();
        }
        if (!"".equals(sgdto.getGoodsPriceLow()) && sgdto.getGoodsPriceLow() != null && "".equals(sgdto.getGoodsPriceHigh()) && sgdto.getGoodsPriceHigh() == null) {
            SQL += "AND GOODS_PRICE < " + sgdto.getGoodsPriceLow();
        }
        if ("".equals(sgdto.getGoodsPriceLow()) && sgdto.getGoodsPriceLow() == null && !"".equals(sgdto.getGoodsPriceHigh()) && sgdto.getGoodsPriceHigh() != null) {
            SQL += "AND GOODS_PRICE > " + sgdto.getGoodsPriceHigh();
        }
        if (!"".equals(sgdto.getTimeRange()) && sgdto.getTimeRange() != null) {
            SQL += "AND DATEDIFF(NOW(),create_time) <  " + sgdto.getTimeRange();
        }
        if (!"".equals(sgdto.getGoodsTitle()) && sgdto.getGoodsTitle() != null) {
            SQL += "AND GOODS_TITLE like  '%" + sgdto.getGoodsTitle() + "%'";
        }
        System.out.println(SQL);

        try {
            ps = conn.prepareStatement(SQL);
            rs = ps.executeQuery();
            list = new ArrayList<>();
            while (rs.next()) {
                SecendHandGoodsDto dto = new SecendHandGoodsDto();
                dto.setGoodsId(rs.getInt("GOODS_ID"));
                dto.setGoodsTitle(rs.getString("GOODS_TITLE"));
                dto.setGoodsDescribe(rs.getString("GOODS_DESCRIBE"));
                dto.setGoodsPrice(rs.getDouble("GOODS_PRICE"));
                dto.setAuthorId(rs.getInt("AUTHOR_ID"));
                dto.setCreateTime(rs.getDate("CREATE_TIME"));
                dto.setGoodsImg(rs.getString("GOODS_IMG"));
                dto.setGoodsType(rs.getString("type_name"));
                dto.setGoodsLocation(rs.getString("province_name") + "-" + rs.getString("city_name"));
                list.add(dto);
            }
            if (list.size() > 0) {
                return list;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUnit.close(conn, ps, rs);
        }


        return list;
    }

    @Override
    public SecendHandGoodsDto get2HandGoodsById(SecendHandGoodsDto sgdto) {

        conn = DBUnit.getConnetction();
        String sql = "SELECT" +
                "  goods_id," +
                "  goods_title," +
                "  goods_describe," +
                "  goods_price," +
                "  author_id," +
                "  create_time," +
                "  goods_img," +
                "  type_name," +
                "  city_name," +
                "  goods_status," +
                "  province_name " +
                "FROM SECEND_HAND_GOODS sg " +
                "  JOIN goods_type t ON sg.goods_type = t.type_id " +
                "  JOIN city ON substring_index(sg.goods_location, '-', -1) = city_id " +
                "  JOIN province ON substring_index(sg.goods_location, '-', 1) = city.province_id WHERE GOODS_ID = ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, sgdto.getGoodsId());
            rs = ps.executeQuery();

            if (rs.next()) {
                SecendHandGoodsDto dto = new SecendHandGoodsDto();
                dto.setGoodsId(rs.getInt("GOODS_ID"));
                dto.setGoodsTitle(rs.getString("GOODS_TITLE"));
                dto.setGoodsDescribe(rs.getString("GOODS_DESCRIBE"));
                dto.setGoodsPrice(rs.getDouble("GOODS_PRICE"));
                dto.setAuthorId(rs.getInt("AUTHOR_ID"));
                dto.setCreateTime(rs.getDate("CREATE_TIME"));
                dto.setGoodsImg(rs.getString("GOODS_IMG"));
                dto.setGoodsType(rs.getString("type_name"));
                dto.setGoodsStatus(rs.getInt("goods_status"));
                dto.setGoodsLocation(rs.getString("province_name") + "-" + rs.getString("city_name"));
                return dto;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUnit.close(conn, ps, rs);
        }

        return null;
    }


    @Override
    public Boolean delete2HandGoods(SecendHandGoodsDto sgdto) {
        conn = DBUnit.getConnetction();
        String sql = "DELETE FROM SECEND_HAND_GOODS WHERE GOODS_ID = ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, sgdto.getGoodsId());
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
    public Boolean modify2HandGoods(SecendHandGoodsDto sgdto) {
        conn = DBUnit.getConnetction();
        String sql1 = "UPDATE SECEND_HAND_GOODS SET GOODS_ID = ? ";
        if (!"".equals(sgdto.getGoodsTitle()) && sgdto.getGoodsTitle() != null) {
            sql1 += ",GOODS_TITLE = " + "'" + sgdto.getGoodsTitle() + "'";
        }
        if (!"".equals(sgdto.getGoodsDescribe()) && sgdto.getGoodsDescribe() != null) {
            sql1 += ",GOODS_DESCRIBE = " + "'" + sgdto.getGoodsDescribe() + "'";
        }
        if (!"".equals(sgdto.getGoodsType()) && sgdto.getGoodsType() != null) {
            sql1 += ",GOODS_TYPE = " + "'" + sgdto.getGoodsType() + "'";
        }
        if (!"".equals(sgdto.getGoodsStatus()) && sgdto.getGoodsStatus() != null) {
            sql1 += ",GOODS_STATUS = " + sgdto.getGoodsStatus();
        }
        if (!"".equals(sgdto.getGoodsPrice()) && sgdto.getGoodsPrice() != null) {
            sql1 += ",GOODS_PRICE = " + sgdto.getGoodsPrice();
        }
        if (!"".equals(sgdto.getProvince()) && sgdto.getProvince() != null && !"".equals(sgdto.getCity()) && sgdto.getCity() != null) {
            sql1 += ",GOODS_LOCATION = " + "'" + sgdto.getProvince() + "-" + sgdto.getCity() + "'";
        }
        String sql2 = "WHERE GOODS_ID = ?";
        sql1 += sql2;
        try {
            ps = conn.prepareStatement(sql1);
            ps.setInt(1, sgdto.getGoodsId());
            ps.setInt(2, sgdto.getGoodsId());
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
