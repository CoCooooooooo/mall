package com.market.service.Impl;

import com.market.dao.RoleDao;
import com.market.pojo.Role;
import com.market.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(propagation = Propagation.REQUIRED)
public class RoleServiceImpl implements RoleService {

    @Autowired
    private RoleDao roleDao;

    @Override
    @Transactional(propagation =  Propagation.SUPPORTS)
    public List<Role> findAll() {
        return roleDao.selectAll();
    }
}
