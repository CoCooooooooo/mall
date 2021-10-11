package com.market.service;

import com.market.pojo.User;
import com.market.vo.UserVo;
import java.util.List;

/**
 * @Auther:jiaxuan
 * @Date: 2019/2/22 0022 15:51
 * @Description:
 */
public interface UserService {
    public List<User> findAll();

    public User findById(int id);

    public void addUser(UserVo userVo);

    public void modifyUser(UserVo userVo);

    public void modifyStatus(int id);

}
