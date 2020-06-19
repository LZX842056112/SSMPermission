package com.itheima.web;

import com.github.pagehelper.PageInfo;
import com.itheima.domain.Permission;
import com.itheima.service.IPermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * @author LiZongXiao
 * @create 2020/6/18 17:41
 */
@Controller
@RequestMapping("/permission")
public class PermissionController {
    @Autowired
    IPermissionService permissionService;

    /**
     * 权限添加
     * @param permission
     * @return
     * @throws Exception
     */
    @RequestMapping("/addPermission")
    public String addPermission(Permission permission) throws Exception {
        permissionService.addPermission(permission);
        return "redirect:findAll.do";
    }

    /**
     * 查询全部权限信息
     * @param page
     * @param size
     * @return
     * @throws Exception
     */
    @RequestMapping("/findAll.do")
    public ModelAndView findAll(@RequestParam(value = "page",defaultValue = "1",required = false)String page, @RequestParam(value = "size",defaultValue = "4",required = false) String size) throws Exception {
        ModelAndView mv =  new ModelAndView();
        List<Permission> permissionList = permissionService.findAll(Integer.parseInt(page), Integer.parseInt(size));
        PageInfo pageInfo = new PageInfo(permissionList);
        mv.addObject("permissionList",permissionList);
        mv.addObject("pageInfo",pageInfo);
        mv.setViewName("permission-list");
        return mv;
    }
}
