package com.market.dao;

import com.market.pojo.Order;

import java.util.List;

/**
 * @Auther:jiaxuan
 * @Date: 2019/2/27 0027 21:27
 * @Description:
 */
public interface OrderDao {

    List<Order> selectAll();

    public Integer add(Order order);
}
