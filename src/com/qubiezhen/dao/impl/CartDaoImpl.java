package com.qubiezhen.dao.impl;

import com.qubiezhen.common.DBUnit;
import com.qubiezhen.dao.CartDao;
import com.qubiezhen.dao.dto.CartDto;
import com.qubiezhen.dao.dto.SecendHandGoodsDto;
import com.qubiezhen.dao.dto.UserDTO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by yangj on 2016/12/21.
 */
public class CartDaoImpl implements CartDao {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    @Override
    public CartDto getCartCount(CartDto cartDto) {
        conn = DBUnit.getConnetction();
        String SQL = "SELECT COUNT(GOODS_COUNT) AS N,SUM(GOODS_PRICE_COUNT) AS P FROM CART WHERE USER_ID = ?";
        try {
            ps = conn.prepareStatement(SQL);
            ps.setInt(1, cartDto.getUserId());

            rs = ps.executeQuery();
            if (rs.next()) {
                cartDto.setGoodsCount(rs.getInt("N"));
                cartDto.setGoodsPriceCount(rs.getDouble("P"));
                return cartDto;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUnit.close(conn, ps, rs);
        }
        return null;
    }

    @Override
    public Boolean addToCart(CartDto cartDto) {
        conn = DBUnit.getConnetction();
        String SQL = "INSERT INTO CART(USER_ID,GOODS_ID,GOODS_COUNT,GOODS_PRICE_COUNT) " +
                "VALUES (?,?,?,?)";
        try {
            ps = conn.prepareStatement(SQL);
            ps.setInt(1, cartDto.getUserId());
            ps.setInt(2, cartDto.getGoodsId());
            ps.setInt(3, cartDto.getGoodsCount());
            ps.setDouble(4, cartDto.getGoodsPriceCount());

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
    public List<CartDto> getCartDetail(CartDto dto) {
        conn = DBUnit.getConnetction();
        String sql = "SELECT cart_id,user_id,cart.goods_id,goods_count,goods_price_count,goods_price,goods_title,author_id,goods_img " +
                "from cart JOIN secend_hand_goods ON cart.goods_id = secend_hand_goods.goods_id " +
                "where user_id = ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, dto.getUserId());
            rs = ps.executeQuery();
            List<CartDto> list = new ArrayList<>();
            while (rs.next()) {
                CartDto tempdto = new CartDto();
                SecendHandGoodsDto sgdto = new SecendHandGoodsDto();
                tempdto.setCartId(rs.getInt("cart_id"));
                tempdto.setUserId(rs.getInt("user_id"));
                tempdto.setGoodsId(rs.getInt("cart.goods_id"));
                tempdto.setGoodsCount(rs.getInt("goods_count"));
                tempdto.setGoodsPriceCount(rs.getDouble("goods_price_count"));
                sgdto.setGoodsId(rs.getInt("cart.goods_id"));
                sgdto.setGoodsPrice(rs.getDouble("goods_price"));
                sgdto.setGoodsTitle(rs.getString("goods_title"));
                sgdto.setAuthorId(rs.getInt("author_id"));
                sgdto.setGoodsImg(rs.getString("goods_img"));
                tempdto.setSgdto(sgdto);
                list.add(tempdto);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    @Override
    public Boolean deleteFromCart(CartDto dto) {
        conn = DBUnit.getConnetction();
        String SQL = "DELETE FROM CART WHERE CART_ID = ?";
        try {
            ps = conn.prepareStatement(SQL);
            ps.setInt(1, dto.getCartId());

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
    public Boolean emptyCart(UserDTO udto) {
        conn = DBUnit.getConnetction();
        String SQL = "DELETE FROM CART WHERE USER_ID = ?";
        try {
            ps = conn.prepareStatement(SQL);
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
