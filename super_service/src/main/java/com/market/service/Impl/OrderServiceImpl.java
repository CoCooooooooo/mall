package com.market.service.Impl;

import com.market.dao.OrderDao;
import com.market.dao.RoleDao;
import com.market.pojo.Order;
import com.market.pojo.Role;
import com.market.service.OrderService;
import com.market.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderDao orderDao;

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public List<Order> findAll() {
        return orderDao.selectAll();
    }

    @Override
    public Integer add(Order order) {
        return orderDao.add(order);
    }
}
