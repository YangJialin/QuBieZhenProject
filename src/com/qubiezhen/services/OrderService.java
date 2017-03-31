package com.qubiezhen.services;

import com.qubiezhen.dao.dto.CartDto;
import com.qubiezhen.dao.dto.OrderDto;
import com.qubiezhen.dao.factory.OrderDaoFactory;
import com.qubiezhen.dao.OrderDao;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by yangj on 2016/12/22.
 */
public class OrderService {
    public static OrderDto createOrder(int userId) {
        List<CartDto> list = new ArrayList<>();
        CartDto cartdto = new CartDto();

        OrderDao orderdao = OrderDaoFactory.getOrderDao();
        Integer orderId = orderdao.createOrder(userId);
        if (orderdao != null) {
            cartdto.setUserId(userId);
            list = CartService.getCartDetail(cartdto);
            if (list.size() > 0) {
                for (CartDto dto : list) {
                    orderdao.createOrderDetail(dto);
                }
                OrderDto orderdto = new OrderDto();
                orderdto.setOrderId(orderId);
                return orderdto;
            }


        }


        return null;
    }

    public static OrderDto getOrderDetail(int orderId) {
        OrderDao orderdao = OrderDaoFactory.getOrderDao();
        return orderdao.getOrder(orderId);
    }

    public static List<OrderDto> getOrderByUser(Integer userId) {
        OrderDao orderdao = OrderDaoFactory.getOrderDao();
        return orderdao.getOrderByUser(userId);
    }

    public static List<OrderDto> getOrderList(OrderDto orderdto) {
        OrderDao orderdao = OrderDaoFactory.getOrderDao();
        return orderdao.getOrderList(orderdto);
    }

    public static Boolean payOrder(OrderDto orderDto) {
        OrderDao orderdao = OrderDaoFactory.getOrderDao();
        return orderdao.payOrder(orderDto);

    }
}
