package com.market.service;


import com.market.common.exception.SysuserNotExistException;
import com.market.params.SysuserParam;
import com.market.pojo.Sysuser;
import com.market.vo.SysuserVo;

import java.util.List;


public interface SysuserService {

    public List<Sysuser> findAll();

    public Sysuser findById(int id);

    public void add(SysuserVo sysuserVo);

    public void modify(SysuserVo sysuserVo);

    public void modifyStatus(int id);

    List<Sysuser> findByParams(SysuserParam sysuserParam);

    Sysuser login(String loginName, String password) throws SysuserNotExistException;
}
