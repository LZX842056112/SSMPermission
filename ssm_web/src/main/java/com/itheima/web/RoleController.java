package com.itheima.web;

import com.github.pagehelper.PageInfo;
import com.itheima.domain.Role;
import com.itheima.service.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * @author LiZongXiao
 * @create 2020/6/17 22:10
 */
@Controller
@RequestMapping("/role")
public class RoleController {

    @Autowired
    IRoleService roleService;

    /**
     * 查询全部角色信息
     * @return
     * @throws Exception
     */
    @RequestMapping("findAll.do")
    public ModelAndView findAll(@RequestParam(value = "page",defaultValue = "1",required = false) String page, @RequestParam(value = "size",defaultValue = "4",required = false) String size) throws Exception {
        ModelAndView mv = new ModelAndView();
        List<Role> roleList = roleService.findAll(Integer.parseInt(page),Integer.parseInt(size));
        PageInfo pageInfo = new PageInfo(roleList);
        mv.addObject("pageInfo",pageInfo);
        mv.addObject("roleList",roleList);
        mv.setViewName("role-list");
        return mv;
    }
}
