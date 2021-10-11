package com.market.dao;

import com.market.params.UserParam;
import com.market.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @Auther:jiaxuan
 * @Date: 2019/2/22 0022 15:35
 * @Description:
 */
public interface UserDao {
    public List<User> selectAll();

    public User selectById(int id);

    public void insertUser(User user);

    public void updateUser(User user);

    public void updateStatus(@Param("id") int id, @Param("isValid") int isValid);

    List<User> selectByParams(UserParam userParam);
}
