package com.qubiezhen.dao;

import com.qubiezhen.dao.dto.CartDto;
import com.qubiezhen.dao.dto.OrderDto;
import com.qubiezhen.dao.dto.SecendHandGoodsDto;

import java.sql.Connection;
import java.util.List;

/**
 * Created by yangj on 2016/12/21.
 */
public interface OrderDao {
    Integer createOrder(int userId);

    Boolean createOrderDetail(CartDto dto);

    OrderDto getOrder(int orderId);

    List<SecendHandGoodsDto> getOrderDetail(Connection conn, int orderId);

    List<OrderDto> getOrderByUser(Integer orderId);

//    abstract List<SecendHandGoodsDto> getOrderDetailByUser(Connection conn, int orderId);

    Boolean payOrder(OrderDto orderDto);

    List<OrderDto> getOrderList(OrderDto orderdto);
}
