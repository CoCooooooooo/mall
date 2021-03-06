package com.market.service.Impl;

import com.market.common.constant.SysuserConstant;
import com.market.common.exception.SysuserNotExistException;
import com.market.dao.SysuserDao;
import com.market.params.SysuserParam;
import com.market.pojo.Role;
import com.market.pojo.Sysuser;
import com.market.service.SysuserService;
import com.market.vo.SysuserVo;
import org.apache.commons.beanutils.PropertyUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.lang.reflect.InvocationTargetException;
import java.util.Date;
import java.util.List;

@Service
@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
public class SysuserServiceImpl implements SysuserService {

    @Autowired
    private SysuserDao sysuserDao;

    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public List<Sysuser> findAll() {
        return sysuserDao.selectAll();
    }

    @Override
    public Sysuser findById(int id) {
        return sysuserDao.selectById(id);
    }

    @Override
    public void add(SysuserVo sysuserVo) {
        Sysuser sysuser = new Sysuser();

        try {
            PropertyUtils.copyProperties(sysuser,sysuserVo);
            //角色ID
            Role role = new Role();
            role.setId(sysuserVo.getRoleId());
            sysuser.setRole(role);
            //默认为有效
            sysuser.setIsValid(SysuserConstant.SYSUSER_VALID);
            //创建时间为当前时间
            sysuser.setCreateDate(new Date());
            sysuserDao.insert(sysuser);

        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        } catch (NoSuchMethodException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void modify(SysuserVo sysuserVo) {
        Sysuser sysuser = new  Sysuser();
        sysuserDao.update(sysuser);
    }

    @Override
    public void modifyStatus(int id) {
        Sysuser sysuser = sysuserDao.selectById(id);
        int isValid = sysuser.getIsValid();
        if(isValid == SysuserConstant.SYSUSER_VALID){
            isValid = SysuserConstant.SYSUSER_INVALID;
        }else {
            isValid = SysuserConstant.SYSUSER_VALID;
        }
        sysuserDao.updateStatus(id,isValid);
    }

    @Override
    public List<Sysuser> findByParams(SysuserParam sysuserParam) {
        return sysuserDao.selectByParams(sysuserParam);
    }

    @Override
    public Sysuser login(String loginName, String password) throws SysuserNotExistException {
        Sysuser sysuser = sysuserDao.selectByLoginNameAndPassword(loginName,password,SysuserConstant.SYSUSER_VALID);
        if (sysuser!=null){
            return sysuser;
        }
        throw new SysuserNotExistException("用户名或密码不正确");
    }

}
