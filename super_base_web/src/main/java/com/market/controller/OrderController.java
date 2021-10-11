package com.market.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.market.common.constant.PageConstant;
import com.market.common.constant.ResponseStatusConstant;
import com.market.common.util.DateUtil;
import com.market.common.util.ResponsResult;
import com.market.pojo.Order;
import com.market.pojo.User;
import com.market.service.OrderService;
import com.market.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * @Auther:jiaxuan
 * @Date: 2019/2/25 0025 17:57
 * @Description:
 */
@Controller
@RequestMapping("/base/order")
public class OrderController {

    @Autowired
    private OrderService orderService;

    @Autowired
    private UserService userService;

    @ModelAttribute("user")
    public List<User> loadUsers(){
        List<User> users = userService.findAll();
        return users;
    }

    @RequestMapping("/findAll")
    public String findAll(Integer pageNum, Model model){
        if (pageNum==null){
            pageNum= PageConstant.PAGE_NUM;
        }
        //设置分页
        PageHelper.startPage(pageNum,PageConstant.PAGE_SIZE);
        List<Order> orders = orderService.findAll();

        PageInfo<Order> pageInfo = new PageInfo<>(orders);
        model.addAttribute("pageInfo",pageInfo);

        return "Order";
    }

    @RequestMapping("/addorder")
    @ResponseBody
    public ResponsResult add(Order order){
        ResponsResult result = new ResponsResult();
        Date day = new Date();
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
        String code = sdf.format(day).toString()+String.valueOf((int)(Math.random()*6000+1000));
        User user = new User();
        order.setCode(code);
        order.setcDate(DateUtil.getCurrentDateStr());
        order.setUserId(user);
        orderService.add(order);
        result.setStatus(ResponseStatusConstant.RESPONSE_STATUS_SUCCESS);
        result.setMessage("添加成功");
        return result;
    }
}
