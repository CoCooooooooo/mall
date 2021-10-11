package com.market.vo;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

/**
 * @Auther:jiaxuan
 * @Date: 2019/2/20 0020 16:15
 * @Description:
 */
public class ProductVo {
    private String name;
    private Integer number;
    private Double price;
    private String info;
    private CommonsMultipartFile file;
    private Integer productTypeId;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public CommonsMultipartFile getFile() {
        return file;
    }

    public void setFile(CommonsMultipartFile file) {
        this.file = file;
    }

    public Integer getProductTypeId() {
        return productTypeId;
    }

    public void setProductTypeId(Integer productTypeId) {
        this.productTypeId = productTypeId;
    }
}
