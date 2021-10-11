package com.market.pojo;

import java.io.Serializable;

/**
 * @Auther:jiaxuan
 * @Date: 2019/2/27 0027 21:24
 * @Description:
 */
public class Order implements Serializable {
    private Integer id;
    private String code;
    private Double price;
    private String cDate;
    private User userId;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public User getUserId() {
        return userId;
    }

    public void setUserId(User userId) {
        this.userId = userId;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public String getcDate() {
        return cDate;
    }

    public void setcDate(String cDate) {
        this.cDate = cDate;
    }
}
