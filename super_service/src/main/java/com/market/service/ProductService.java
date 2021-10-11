package com.market.service;

import com.market.dto.ProductDto;
import com.market.pojo.Product;
import org.apache.commons.fileupload.FileUploadException;

import java.io.OutputStream;
import java.util.List;

/**
 * @Auther:jiaxuan
 * @Date: 2019/2/20 0020 16:21
 * @Description:
 */
public interface ProductService {

    //public int add(Product product);

    public void add(ProductDto productDto) throws FileUploadException;

    boolean checkName(String name);

    List<Product> findAll();

    Product findById(int id);

    void modify(ProductDto productDto) throws FileUploadException;

    void getImage(String path, OutputStream outputStream);


    public void updateNum(Product product);

    void removeById(int id);
}
