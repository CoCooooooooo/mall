package com.market.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.market.common.constant.PageConstant;
import com.market.common.exception.SysuserNotExistException;
import com.market.common.util.ResponsResult;
import com.market.params.SysuserParam;
import com.market.pojo.Role;
import com.market.pojo.Sysuser;
import com.market.service.RoleService;
import com.market.service.SysuserService;
import com.market.vo.SysuserVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @Auther:jiaxuan
 * @Date: 2019/2/19 0019 15:30
 * @Description:
 */
@Controller
@RequestMapping("/base/sysuser")
public class SysuserController {

    @Autowired
    private SysuserService sysuserService;

    @Autowired
    private RoleService roleService;

    @RequestMapping("/login")
    public String login(String loginName, String password, HttpSession session,Model model){
        try {
            Sysuser sysuser = sysuserService.login(loginName,password);
            session.setAttribute("sysuser",sysuser);
            return "main";
        } catch (SysuserNotExistException e) {
            model.addAttribute("errorMsg",e.getMessage());
            return "login";
        }


    }

    @RequestMapping("/findAll")
    public String findAll(Integer pageNum, Model model){
        if (pageNum==null){
            pageNum= PageConstant.PAGE_NUM;
        }
        PageHelper.startPage(pageNum,PageConstant.PAGE_SIZE);
        List<Sysuser> sysusers = sysuserService.findAll();
        PageInfo<Sysuser> pageInfo = new PageInfo<>(sysusers);
        model.addAttribute("pageInfo",pageInfo);
        return "sysuserManager";
    }

    @RequestMapping("/findByParams")
    public String findByParams(SysuserParam sysuserParam,Integer pageNum,Model model){
        if (pageNum==null){
            pageNum=PageConstant.PAGE_NUM;
        }
        PageHelper.startPage(pageNum,PageConstant.PAGE_SIZE);
        List<Sysuser> sysusers = sysuserService.findByParams(sysuserParam);
        PageInfo<Sysuser> pageInfo = new PageInfo<>(sysusers);
        model.addAttribute("pageInfo",pageInfo);
        //数据回显  让之前查询的条件还在
        model.addAttribute("sysuserParam",sysuserParam);

        return "sysuserManager";
    }

    @RequestMapping("/findById")
    @ResponseBody
    public ResponsResult findById(int id){
        Sysuser sysuser = sysuserService.findById(id);
        return ResponsResult.success(sysuser);
    }

    @RequestMapping("/add")
    @ResponseBody
    public ResponsResult add(SysuserVo sysuserVo){
        sysuserService.add(sysuserVo);
        return ResponsResult.success();

    }

    @ModelAttribute("roles")
    public List<Role> loadRoles(){
        return roleService.findAll();
    }

    @RequestMapping("/modify")
    @ResponseBody
    public ResponsResult modify(SysuserVo sysuserVo){
        sysuserService.modify(sysuserVo);
        return ResponsResult.success("修改成功");
    }


    @RequestMapping("/modifyStatus")
    @ResponseBody
    public ResponsResult modifyStatus(int id){
        sysuserService.modifyStatus(id);
        return ResponsResult.success() ;
    }

}
