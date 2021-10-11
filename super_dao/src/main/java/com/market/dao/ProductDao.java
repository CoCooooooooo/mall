package com.market.dao;

import com.market.pojo.Product;
import org.apache.commons.fileupload.FileUploadException;

import java.util.List;

/**
 * @Auther:jiaxuan
 * @Date: 2019/2/21 0021 13:02
 * @Description:
 */
public interface ProductDao {
    public void insert(Product product);

    //int insert(Product product);

    Product selectByName(String name);

    List<Product> selectAll();

    Product selectById(int id);

    int update(Product product);

    void deleteById(int id);



}
