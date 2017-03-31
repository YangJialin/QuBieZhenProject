package com.qubiezhen.dao.impl;

import com.qubiezhen.common.DBUnit;
import com.qubiezhen.dao.OrderDao;
import com.qubiezhen.dao.dto.CartDto;
import com.qubiezhen.dao.dto.OrderDto;
import com.qubiezhen.dao.dto.SecendHandGoodsDto;
import com.qubiezhen.dao.dto.UserDTO;
import com.qubiezhen.dao.factory.GetUserInfoFactory;
import com.qubiezhen.dao.factory.UserDaoFactory;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by yangj on 2016/12/21.
 */
public class OrderDaoImpl implements OrderDao {
    Connection conn;
    PreparedStatement ps;
    ResultSet rs;

    @Override
    public Integer createOrder(int userId) {
        conn = DBUnit.getConnetction();
        String SQL1 = "INSERT INTO ORDERS(USER_ID,CREATE_TIME,SUM_PRICE) " +
                "VALUES(?,NOW(),(SELECT SUM(GOODS_PRICE_COUNT) FROM CART WHERE USER_ID = ?))";

        try {
            ps = conn.prepareStatement(SQL1);
            ps.setInt(1, userId);
            ps.setInt(2, userId);
            int i = ps.executeUpdate();
            if (i > 0) {
                ps = conn.prepareStatement("SELECT MAX(ORDER_ID) FROM ORDERS WHERE USER_ID = ?");
                ps.setInt(1, userId);
                rs = ps.executeQuery();
                if (rs.next()) {
                    return rs.getInt(1);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUnit.close(conn, ps, rs);
        }
        return null;
    }

    public Boolean createOrderDetail(CartDto cartdto) {
        conn = DBUnit.getConnetction();
        String SQL2 = "INSERT INTO GOODS_IN_ORDER(ORDER_ID,GOODS_ID,GOODS_COUNT) VALUES((SELECT MAX(ORDER_ID) FROM ORDERS WHERE USER_ID = ?),?,?)";
        try {
            ps = conn.prepareStatement(SQL2);
            ps.setInt(1, cartdto.getUserId());
            ps.setInt(2, cartdto.getGoodsId());
            ps.setInt(3, cartdto.getGoodsCount());
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
    public OrderDto getOrder(int orderId) {
        conn = DBUnit.getConnetction();
        String SQL = "SELECT * FROM ORDERS WHERE ORDER_ID = ?";
        try {
            ps = conn.prepareStatement(SQL);
            ps.setInt(1, orderId);
            rs = ps.executeQuery();
            OrderDto odto = new OrderDto();
            if (rs.next()) {
                //把order信息添加进odto，然后再执行具体商品的查询，插入到odto的sgsdto中
                odto.setOrderId(rs.getInt("order_id"));
                odto.setUserId(rs.getInt("user_id"));
                odto.setCreateTime(rs.getTimestamp("create_time"));
                odto.setCompleteTime(rs.getTimestamp("complete_time"));
                odto.setSumPrice(rs.getDouble("sum_price"));
                odto.setOrderStatus(rs.getInt("order_status"));
                odto.setBusinessType(rs.getInt("business_type"));
                UserDTO userDTO = new UserDTO();
                userDTO.setUserId(rs.getInt("user_id"));
                odto.setUdto(GetUserInfoFactory.getUserInfoDao().getUserInfoById(userDTO));
                odto.setSgList(getOrderDetail(conn, rs.getInt("order_id")));
                return odto;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUnit.close(conn, ps, rs);
        }
        return null;
    }

    @Override
    public List<SecendHandGoodsDto> getOrderDetail(Connection conn, int orderId) {
        String SQL = "SELECT * FROM goods_in_order AS gio " +
                "JOIN secend_hand_goods AS sg ON gio.goods_id = sg.goods_id" +
                " WHERE gio.order_id = ?";
        try {
            ps = conn.prepareStatement(SQL);
            ps.setInt(1, orderId);
            rs = ps.executeQuery();
            List<SecendHandGoodsDto> list = new ArrayList<>();
            while (rs.next()) {
                SecendHandGoodsDto sgdto = new SecendHandGoodsDto();
                sgdto.setGoodsId(rs.getInt("sg.goods_id"));
                sgdto.setGoodsTitle(rs.getString("GOODS_TITLE"));
                sgdto.setGoodsDescribe(rs.getString("GOODS_DESCRIBE"));
                sgdto.setGoodsPrice(rs.getDouble("GOODS_PRICE"));
                sgdto.setAuthorId(rs.getInt("AUTHOR_ID"));
                sgdto.setCreateTime(rs.getDate("CREATE_TIME"));
                sgdto.setGoodsImg(rs.getString("GOODS_IMG"));
                sgdto.setGoodsType(rs.getString("GOODS_TYPE"));
                sgdto.setGoodsCount(rs.getInt("GOODS_COUNT"));
                sgdto.setGoodsLocation(rs.getString("GOODS_LOCATION"));
                list.add(sgdto);

            }
            if (list.size() > 0) {
                return list;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public Boolean payOrder(OrderDto orderDto) {
        conn = DBUnit.getConnetction();
        String SQL = "UPDATE ORDERS SET ORDER_STATUS = 1,COMPLETE_TIME = NOW() WHERE ORDER_ID = ?";
        try {
            ps = conn.prepareStatement(SQL);
            ps.setInt(1, orderDto.getOrderId());
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
    public List<OrderDto> getOrderByUser(Integer userId) {
        conn = DBUnit.getConnetction();
        String SQL = "SELECT * FROM ORDERS WHERE 1=1";
        try {

            if (userId != null && userId != 0) {
                SQL += " AND USER_ID = " + userId;
            }
            SQL += " ORDER BY ORDER_ID ASC";
            ps = conn.prepareStatement(SQL);
            rs = ps.executeQuery();
            List<OrderDto> list = new ArrayList<>();
            while (rs.next()) {
                OrderDto odto = new OrderDto();
                odto.setOrderId(rs.getInt("order_id"));
                odto.setUserId(rs.getInt("user_id"));
                odto.setCreateTime(rs.getTimestamp("create_time"));
                odto.setCompleteTime(rs.getTimestamp("complete_time"));
                odto.setSumPrice(rs.getDouble("sum_price"));
                odto.setOrderStatus(rs.getInt("order_status"));
                odto.setBusinessType(rs.getInt("business_type"));
//                odto.setSgList(getOrderDetail(conn, rs.getInt("order_id")));
                list.add(odto);
            }
            if (list.size() > 0) {
                return list;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUnit.close(conn, ps, rs);
        }
        return null;
    }

    @Override
    public List<OrderDto> getOrderList(OrderDto orderdto) {
        conn = DBUnit.getConnetction();
        String SQL = "SELECT * FROM ORDERS WHERE 1=1";
        try {

            if (orderdto.getUserId() != null && orderdto.getUserId() != 0) {
                SQL += " AND USER_ID = " + orderdto.getUserId();
            }
            if (orderdto.getOrderId() != null && !"".equals(orderdto.getOrderId())) {
                SQL += " AND ORDER_ID = " + orderdto.getOrderId();
            }
            if (orderdto.getOrderStatus() != null && !"".equals(orderdto.getOrderStatus())) {
                SQL += " AND ORDER_STATUS = " + orderdto.getOrderStatus();
            }
            System.out.println(SQL);
            ps = conn.prepareStatement(SQL);
            rs = ps.executeQuery();
            List<OrderDto> list = new ArrayList<>();
            while (rs.next()) {
                OrderDto odto = new OrderDto();
                odto.setOrderId(rs.getInt("order_id"));
                odto.setUserId(rs.getInt("user_id"));
                odto.setCreateTime(rs.getTimestamp("create_time"));
                odto.setCompleteTime(rs.getTimestamp("complete_time"));
                odto.setSumPrice(rs.getDouble("sum_price"));
                odto.setOrderStatus(rs.getInt("order_status"));
                odto.setBusinessType(rs.getInt("business_type"));
                list.add(odto);
            }
            if (list.size() > 0) {
                return list;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUnit.close(conn, ps, rs);
        }
        return null;
    }

    //    @Override
//    public List<SecendHandGoodsDto> getOrderDetailByUser(Connection conn, int orderId) {
//        String SQL = "SELECT * FROM goods_in_order AS gio " +
//                "JOIN secend_hand_goods AS sg ON gio.goods_id = sg.goods_id" +
//                " WHERE gio.order_id = ?";
//        try {
//            ps = conn.prepareStatement(SQL);
//            ps.setInt(1, orderId);
//            rs = ps.executeQuery();
//            List<SecendHandGoodsDto> list = new ArrayList<>();
//            while (rs.next()) {
//                SecendHandGoodsDto sgdto = new SecendHandGoodsDto();
//                sgdto.setGoodsId(rs.getInt("sg.goods_id"));
//                sgdto.setGoodsTitle(rs.getString("GOODS_TITLE"));
//                sgdto.setGoodsDescribe(rs.getString("GOODS_DESCRIBE"));
//                sgdto.setGoodsPrice(rs.getDouble("GOODS_PRICE"));
//                sgdto.setAuthorId(rs.getInt("AUTHOR_ID"));
//                sgdto.setCreateTime(rs.getDate("CREATE_TIME"));
//                sgdto.setGoodsImg(rs.getString("GOODS_IMG"));
//                sgdto.setGoodsType(rs.getString("GOODS_TYPE"));
//                sgdto.setGoodsCount(rs.getInt("GOODS_COUNT"));
//                sgdto.setGoodsLocation(rs.getString("GOODS_LOCATION"));
//                list.add(sgdto);
//
//            }
//            if (list.size() > 0) {
//                return list;
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//        return null;
//    }
}
