package com.market.service.Impl;

import com.market.common.constant.UserConstant;
import com.market.dao.UserDao;
import com.market.pojo.User;
import com.market.service.UserService;
import com.market.vo.UserVo;
import org.apache.commons.beanutils.PropertyUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.lang.reflect.InvocationTargetException;
import java.util.Date;
import java.util.List;

/**
 * @Auther:jiaxuan
 * @Date: 2019/2/22 0022 15:51
 * @Description:
 */
@Service
@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public List<User> findAll() {
        return userDao.selectAll();
    }

    @Override
    public User findById(int id) {
        return userDao.selectById(id);
    }

    @Override
    public void addUser(UserVo userVo) {
        User user = new User();
        try {
            PropertyUtils.copyProperties(user,userVo);

            user.setIsValid(UserConstant.USER_VALID);

            userDao.insertUser(user);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        } catch (NoSuchMethodException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void modifyUser(UserVo userVo) {

    }

    @Override
    public void modifyStatus(int id) {

    }
}
