package com.market.service.Impl;

import com.market.common.util.StringUtils;
import com.market.dao.ProductDao;
import com.market.dto.ProductDto;
import com.market.pojo.Product;
import com.market.pojo.ProductType;
import com.market.service.ProductService;
import org.apache.commons.beanutils.PropertyUtils;
import org.apache.commons.fileupload.FileUploadException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StreamUtils;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

/**
 * @Auther:jiaxuan
 * @Date: 2019/2/20 0020 16:35
 * @Description:
 */
@Service
/**
 * 声明式事务
 * 1.如果存在一个事务，则支持当前事务。如果没有事务则开启
 * 2.事物在遇到非运行时异常时也回滚
 */
@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductDao productDao;


    @Override
    public void add(ProductDto productDto) throws FileUploadException {
        //1.文件上传
        String fileName = StringUtils.renameFileName(productDto.getFileName());
        String filePath = productDto.getUploadPath()+"/"+fileName;

        try {
            StreamUtils.copy(productDto.getInputStream(),new FileOutputStream(filePath));
        } catch (IOException e) {
            //e.printStackTrace();
            throw new FileUploadException("文件上传失败"+e.getMessage());
        }
        //2.保存到数据库，将DTO转换为PO
        Product product = new Product();
        try {
            PropertyUtils.copyProperties(product,productDto);
            product.setImage(filePath);

            ProductType productType = new ProductType();
            productType.setId(productDto.getProductTypeId());

            product.setProductType(productType);

            productDao.insert(product);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


//    @Override
//    public int add(Product product) {
//        return productDao.insert(product);
//    }

    @Override
    public boolean checkName(String name) {
        Product product = productDao.selectByName(name);
        if (product!=null){
            return false;
        }
        return true;
    }

    @Override
    public List<Product> findAll() {
        return productDao.selectAll();
    }

    @Override
    public Product findById(int id) {
        return productDao.selectById(id);
    }

    @Override
    public void modify(ProductDto productDto) throws FileUploadException {
        // 1.文件上传
        String fileName = StringUtils.renameFileName(productDto.getFileName());
        String filePath=productDto.getUploadPath()+"/"+fileName;
        try {
            StreamUtils.copy(productDto.getInputStream(),new FileOutputStream(filePath));
        } catch (IOException e) {
            throw new FileUploadException("文件上传失败"+e.getMessage());
        }
        // 2.保存到数据库，将DTO转换为PO
        Product product = new Product();
        try {
            PropertyUtils.copyProperties(product,productDto);
            product.setImage(filePath);

            ProductType productType = new ProductType();
            productType.setId(productDto.getProductTypeId());

            product.setProductType(productType);
            productDao.update(product);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    /**
     * 获取图片，写到输出流中
     * @param path
     * @param outputStream
     */
    @Override
    public void getImage(String path, OutputStream outputStream) {
        try {
            StreamUtils.copy(new FileInputStream(path),outputStream);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void updateNum(Product product) {
         productDao.update(product);
    }

    @Override
    public void removeById(int id) {
        productDao.deleteById(id);
    }
}
