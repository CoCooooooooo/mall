package com.market.service;

import com.market.common.exception.ProductTypeExistsException;
import com.market.pojo.ProductType;

import java.util.List;

/**
 * @Auther:jiaxuan
 * @Date: 2019/2/19 0019 16:01
 * @Description:
 */
public interface ProductTypeService {
    /**
     * 查找所有商品类型信息
     * @return
     */
    public List<ProductType> findAll();
    /**
     * 添加商品类型信息
     * 判断是否已存在
     *         抛异常
     * @return
     */
    public void add(String name) throws ProductTypeExistsException;

    /**
     * 根据id查找商品类型
     * @param id
     * @return
     */
    ProductType findById(int id);
    /**
     * 修改商品类型名字
     * @param id name
     * @return
     */
    void modifyName(int id, String name)throws ProductTypeExistsException;
    /**
     * 删除商品类型
     * @param id name
     * @return
     */
    void removeById(int id);
    /**
     * 修改商品类型状态
     * @param id name
     * @return
     */
    void modifyStatus(int id);
    /**
     * 查找有效的商品类型信息
     * @return
     */
    List<ProductType> findEnable();
}
