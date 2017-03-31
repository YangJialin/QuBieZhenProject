package com.qubiezhen.actions;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.qubiezhen.dao.dto.OrderDto;
import com.qubiezhen.dao.dto.UserDTO;
import com.qubiezhen.services.CartService;
import com.qubiezhen.services.OrderService;
import org.apache.struts2.ServletActionContext;

import java.util.List;
import java.util.Map;

/**
 * Created by yangj on 2016/12/21.
 */
public class OrderAction extends ActionSupport {
    private OrderDto orderdto;
    private List<OrderDto> orderList;

    public List<OrderDto> getOrderList() {
        return orderList;
    }

    public void setOrderList(List<OrderDto> orderList) {
        this.orderList = orderList;
    }


    public OrderDto getOrderdto() {
        return orderdto;
    }

    public void setOrderdto(OrderDto orderdto) {
        this.orderdto = orderdto;
    }

    public String createOrder() {
        UserDTO udto = new UserDTO();
        Map session = ActionContext.getContext().getSession();
        udto = (UserDTO) session.get("user");
        if (udto != null) {
            this.orderdto = OrderService.createOrder(udto.getUserId());
            return SUCCESS;
        }
        return ERROR;
    }

    public String queryOrderDetail() {
        OrderDto temp = OrderService.getOrderDetail(orderdto.getOrderId());
        if (temp != null) {
            System.out.println(temp.getOrderStatus());
            System.out.println(temp.getSgList().size());
            this.orderdto = temp;
            return SUCCESS;
        }
        return ERROR;
    }

    public String queryOrderList() {
        List<OrderDto> tempList = OrderService.getOrderList(orderdto);
        if (tempList != null) {
            this.orderList = tempList;
            return SUCCESS;
        }
        return ERROR;
    }

    public String queryOrderByUser() {
        List<OrderDto> temp = OrderService.getOrderByUser(orderdto.getUserId());
        if (temp != null) {
            this.orderList = temp;
            return SUCCESS;
        }
        return ERROR;
    }

    public String payOrder() {
        UserDTO udto;
        Map session = ActionContext.getContext().getSession();
        udto = (UserDTO) session.get("user");
        if (OrderService.payOrder(orderdto) && CartService.emptyFromCart(udto)) {
            return SUCCESS;
        }

        return ERROR;
    }

}
