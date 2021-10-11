package com.market.dao;

import com.market.params.SysuserParam;
import com.market.pojo.Sysuser;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @Auther:jiaxuan
 * @Date: 2019/2/21 0021 14:44
 * @Description:
 */
public interface SysuserDao {
    public List<Sysuser> selectAll();

    public Sysuser selectById(int id);

    public void insert(Sysuser sysuser);

    public void update(Sysuser sysuser);

    public void updateStatus(@Param("id") int id, @Param("isValid") int isValid);

    List<Sysuser> selectByParams(SysuserParam sysuserParam);

    Sysuser selectByLoginNameAndPassword(@Param("loginName")String loginName, @Param("password")String password, @Param("isValid")int isValid);
}
