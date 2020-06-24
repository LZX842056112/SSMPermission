package com.itheima.web;

import com.github.pagehelper.PageInfo;
import com.itheima.domain.Permission;
import com.itheima.domain.Role;
import com.itheima.domain.UserInfo;
import com.itheima.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * @author LiZongXiao
 * @create 2020/6/5 22:03
 */
@Controller()
@RequestMapping("/user")
public class UserController {

    @Autowired
    private IUserService userService;

    /**
     * 用户添加角色，只有lzx用户可操作
     * @param userId
     * @param roleIds
     * @return
     * @throws Exception
     */
    @RequestMapping("/addRoleToUser.do")
    @PreAuthorize("authentication.principal.username == 'lzx'")
    public String addRoleToUser(@RequestParam(value = "userId") String userId,@RequestParam(value = "ids",defaultValue = "") String[] roleIds) throws Exception {
        if (roleIds != null && !"".equals(roleIds)){
            userService.addRoleToUser(userId,roleIds);
        }
        return "redirect:findAll.do";
    }

    /**
     * 添加角色前，查询所有当前该用户没有关联的角色，只有lzx用户可操作
     * @param id
     * @return
     */
    @RequestMapping("/findUserByIdAndAllRole.do")
    @PreAuthorize("authentication.principal.username == 'lzx'")
    public ModelAndView findUserByIdAndAllRole(@RequestParam(value = "id") String id) throws Exception {
        ModelAndView mv = new ModelAndView();
        List<Role> roleList = userService.findUserByIdAndAllRole(id);
        UserInfo userInfo = userService.findById(id);
        mv.addObject("roleList",roleList);
        mv.addObject("userInfo",userInfo);
        mv.setViewName("user-role-add");
        return mv;
    }

    /**
     * 用户详情
     * @param id
     * @return
     */
    @RequestMapping("/findById.do")
    public ModelAndView findById(@RequestParam(value = "id") String id) throws Exception {
        ModelAndView mv = new ModelAndView();
        UserInfo userInfo = userService.findById(id);
        for (Role role : userInfo.getRoles()) {
            System.out.println(role+"----");
            for (Permission permission : role.getPermissions()) {
                System.out.println(permission);
            }
        }
        mv.addObject("userInfo",userInfo);
        mv.setViewName("user-show");
        return mv;
    }

    /**
     * 添加用户，只有lzx用户可操作
     * @param userInfo
     * @return
     */
    @RequestMapping("/addUser.do")
    @PreAuthorize("authentication.principal.username == 'lzx'")
    public String addUser(UserInfo userInfo) throws Exception {
        userService.addUser(userInfo);
        return "redirect:findAll.do";
    }

    /**
     * 查询全部用户信息，模糊查询
     * @param page
     * @param size
     * @param fuzzyName
     * @return
     * @throws Exception
     */
    @RequestMapping("/findAll.do")
    public ModelAndView findAll(@RequestParam(value = "page",defaultValue = "1",required = false) String page,@RequestParam(value = "size",defaultValue = "4",required = false) String size,@RequestParam(value = "fuzzyName",defaultValue = "",required = false) String fuzzyName) throws Exception {
        ModelAndView mv = new ModelAndView();
        List<UserInfo> userInfoList = userService.findAll(Integer.parseInt(page), Integer.parseInt(size),fuzzyName);
        PageInfo pageInfo = new PageInfo(userInfoList);
        mv.addObject("userInfoList",userInfoList);
        mv.addObject("fuzzyName",fuzzyName);
        mv.addObject("pageInfo",pageInfo);
        mv.setViewName("user-list");
        return mv;
    }
}
