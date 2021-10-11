package com.market.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.market.common.constant.PageConstant;
import com.market.common.util.ResponsResult;
import com.market.pojo.User;
import com.market.service.UserService;
import com.market.vo.UserVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @Auther:jiaxuan
 * @Date: 2019/2/22 0022 15:27
 * @Description:
 */
@Controller
@RequestMapping("/base/user")
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping("/findAll")
    public String  findAll(Integer pageNum, Model model){
        if (pageNum==null){
            pageNum = PageConstant.PAGE_NUM;
        }
        PageHelper.startPage(pageNum,PageConstant.PAGE_SIZE);

        List<User> users = userService.findAll();
        PageInfo<User> pageInfo = new PageInfo<>(users);
        model.addAttribute("pageInfo",pageInfo);

        return "user";
    }

    @RequestMapping("/addUser")
    @ResponseBody
    public ResponsResult add(UserVo userVo){
        userService.addUser(userVo);
        return ResponsResult.success();
    }

}
