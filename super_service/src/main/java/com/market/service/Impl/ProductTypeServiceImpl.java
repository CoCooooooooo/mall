package com.market.service.Impl;

import com.market.common.constant.ProductTypeContant;
import com.market.common.exception.ProductTypeExistsException;
import com.market.dao.ProductTypeDao;
import com.market.pojo.ProductType;
import com.market.service.ProductTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @Auther:jiaxuan
 * @Date: 2019/2/19 0019 16:01
 * @Description:
 */
@Service
@Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
public class ProductTypeServiceImpl implements ProductTypeService {

    @Autowired
    private ProductTypeDao productTypeDao;

    //查找
    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public List<ProductType> findAll() {
        return productTypeDao.selectAll();
    }

    //添加
    @Override
    public void add(String name) throws ProductTypeExistsException {
        ProductType productType = productTypeDao.selectByName(name);
        if (null!=productType){
            throw new ProductTypeExistsException("商品类型已存在！");
        }
        productTypeDao.insert(name, ProductTypeContant.Product_TYPE_ENABLE);

    }
    //根据ID查
    @Override
    public ProductType findById(int id) {
        return productTypeDao.selectById(id);
    }

    //修改商品类型名字
    @Override
    public void modifyName(int id, String name) throws ProductTypeExistsException {
        ProductType productType = productTypeDao.selectByName(name);
        if (null!=productType){
            try {
                throw new ProductTypeExistsException("商品类型名称已存在！");
            } catch (ProductTypeExistsException e) {
                e.printStackTrace();
            }
        }
        productTypeDao.updateName(id,name);
    }
    //删除商品类型的id
    @Override
    public void removeById(int id) {
        productTypeDao.deleteById(id);
    }

    @Override
    public void modifyStatus(int id) {
        ProductType productType = findById(id);
        int status = productType.getStatus();
        if (status==ProductTypeContant.Product_TYPE_ENABLE){
            status=ProductTypeContant.Product_TYPE_DISABLE;
        }else {
            status=ProductTypeContant.Product_TYPE_ENABLE;
        }
        productTypeDao.updateStatus(id,status);
    }

    @Override
    public List<ProductType> findEnable() {
        return productTypeDao.selectByStatus(ProductTypeContant.Product_TYPE_ENABLE);
    }
}
