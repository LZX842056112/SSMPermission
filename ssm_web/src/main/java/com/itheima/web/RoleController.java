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
     * 角色详情
     * @param id
     * @return
     */
    @RequestMapping("/findById.do")
    public ModelAndView findById(@RequestParam(value = "id",required = false)String id) throws Exception {
        ModelAndView mv = new ModelAndView();
        Role role = roleService.findById(id);
        mv.addObject("role",role);
        mv.setViewName("role-show");
        return mv;
    }

    /**
     * 角色批量删除
     * @param idStr
     * @return
     * @throws Exception
     */
    @RequestMapping("/deleteByIdStr.do")
    public String deleteByIdStr(@RequestParam(value = "idStr",defaultValue = "",required = false)String idStr) throws Exception {
        if (idStr != null && idStr != "" && idStr.length()>0){
            String[] ids = idStr.split(",");
            for (String id : ids) {
                System.out.println(id);
                roleService.deleteById(id);
            }
        }
        return "redirect:findAll.do";
    }

    /**
     * 角色删除
     * @param id
     * @return
     * @throws Exception
     */
    @RequestMapping("/deleteById.do")
    public String deleteById(@RequestParam(value = "id",required = false) String id) throws Exception {
        roleService.deleteById(id);
        return "redirect:findAll.do";
    }

    /**
     * 新建角色
     * @param role
     * @return
     * @throws Exception
     */
    @RequestMapping("/addRole.do")
    public String addRole(Role role) throws Exception {
        roleService.addRole(role);
        return "redirect:findAll.do";
    }

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
