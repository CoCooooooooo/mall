package com.market.service;


import com.market.pojo.Order;

import java.util.List;

/**
 * @Auther:jiaxuan
 * @Date: 2019/2/20 0020 16:21
 * @Description:
 */
public interface OrderService {

    List<Order> findAll();

    public Integer add(Order order);

}
