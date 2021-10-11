package com.market.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.market.common.constant.PageConstant;
import com.market.common.constant.ResponseStatusConstant;
import com.market.common.exception.ProductTypeExistsException;
import com.market.common.util.ResponsResult;
import com.market.pojo.ProductType;
import com.market.service.ProductTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import java.util.List;

/**
 * @Auther:jiaxuan
 * @Date: 2019/2/19 0019 15:38
 * @Description:
 */
@Controller
@RequestMapping("/base/productType")
public class ProductTypeController {

    @Autowired
    private ProductTypeService productTypeService;

    /**
     * jiaxuan  
     * @param pageNum
     * @param model
     * @return
     */
    @RequestMapping("/findAll")
    public String findAll(Integer pageNum,Model model){
        if (pageNum==null){
            pageNum= PageConstant.PAGE_NUM;
        }
        //设置分页
        PageHelper.startPage(pageNum,PageConstant.PAGE_SIZE);
        //查找所有商品类型
        List<ProductType> productTypes = productTypeService.findAll();
        //将查找出的结果封装到PageInfo对象中
        PageInfo<ProductType> pageInfo = new PageInfo<>(productTypes);
//        pageInfo.getPageNum();
//        pageInfo.getPages();
        model.addAttribute("pageInfo",pageInfo);

        return "productTypeManager";
    }
    @RequestMapping("/add")
    @ResponseBody
    public ResponsResult add(String name){
        ResponsResult result = new ResponsResult();
        try {
            productTypeService.add(name);
            result.setStatus(ResponseStatusConstant.RESPONSE_STATUS_SUCCESS);
            result.setMessage("添加成功");
        } catch (ProductTypeExistsException e) {
            result.setStatus(ResponseStatusConstant.RESPONSE_STATUS_FAIL);
            result.setMessage(e.getMessage());
        }
        return result;
    }

    @RequestMapping("/findById")
    @ResponseBody
    public ResponsResult findById(int id){
        ProductType productType = productTypeService.findById(id);
        return ResponsResult.success(productType);
    }

    @RequestMapping("/modifyName")
    @ResponseBody
    public ResponsResult modifyName(int id, String name){
        try {
            productTypeService.modifyName(id,name);
            return ResponsResult.success("修改成功");
        } catch (ProductTypeExistsException e) {
            return ResponsResult.fail(e.getMessage());
        }
    }
    @RequestMapping("/removeById")
    @ResponseBody
    public ResponsResult removeById(int id){
        productTypeService.removeById(id);
        return ResponsResult.success();
    }
    @RequestMapping("/modifyStatus")
    @ResponseBody
    public ResponsResult modifyStatus(int id){
        productTypeService.modifyStatus(id);
        return ResponsResult.success();
    }

}
