package com.market.common.util;

import com.market.common.constant.ResponseStatusConstant;

/**
 * @Auther:jiaxuan
 * @Date: 2019/2/20 0020 12:15
 * @Description:
 */
public class ResponsResult {

    //相应的状态码
    private int status;

    //消息
    private String message;

    //返回的数据
    private Object data;

    public int getStatus() {
        return status;
    }

    public ResponsResult() {
    }

    public ResponsResult(int status, String message, Object data) {
        this.status = status;
        this.message = message;
        this.data = data;
    }

    //成功
    public static ResponsResult success(Object data){
        return new ResponsResult(ResponseStatusConstant.RESPONSE_STATUS_SUCCESS,"success",data);
    }
    public static ResponsResult success(String message){
        return new ResponsResult(ResponseStatusConstant.RESPONSE_STATUS_SUCCESS,message,null);
    }

    public static ResponsResult success(){
        return new ResponsResult(ResponseStatusConstant.RESPONSE_STATUS_SUCCESS,"success",null);
    }

    //失败
    public static ResponsResult fail(){
        return new ResponsResult(ResponseStatusConstant.RESPONSE_STATUS_FAIL,"fail",null);
    }

    public static ResponsResult fail(Object data){
        return new ResponsResult(ResponseStatusConstant.RESPONSE_STATUS_FAIL,"fail",data);
    }

    public static ResponsResult fail(String message){
        return new ResponsResult(ResponseStatusConstant.RESPONSE_STATUS_FAIL,message,null);
    }
    public void setStatus(int status) {
        this.status = status;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }
}
