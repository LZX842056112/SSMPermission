package com.itheima.service.impl;

import com.github.pagehelper.PageHelper;
import com.itheima.dao.IUserDao;
import com.itheima.domain.Role;
import com.itheima.domain.UserInfo;
import com.itheima.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * @author LiZongXiao
 * @create 2020/6/4 22:29
 */
@Service("userService")
@Transactional
public class IUserServiceImpl implements IUserService {

    @Autowired
    private IUserDao userDao;

    /**
     * 查询全部用户信息，模糊查询
     * @param page
     * @param size
     * @param fuzzyName
     * @return
     * @throws Exception
     */
    @Override
    public List<UserInfo> findAll(int page,int size,String fuzzyName) throws Exception {
        //分页
        PageHelper.startPage(page,size);
        return userDao.findAll(fuzzyName);
    }

    @Override
    public UserDetails loadUserByUsername(String s) throws UsernameNotFoundException {
        UserInfo userInfo = null;
        try {
            userInfo = userDao.findByUserName(s);
        } catch (Exception e) {
            e.printStackTrace();
        }
        //处理自己的用户对象，封装成UserDetails
        User user = new User(userInfo.getUsername(),"{noop}"+userInfo.getPassword(), userInfo.getStatus() == 0 ? false : true, true, true, true, getAuthority(userInfo.getRoles()));
        return user;
    }

    //作用就是返回一个List集合，集合装入的是角色描述
    public List<SimpleGrantedAuthority> getAuthority(List<Role> roles){
        List<SimpleGrantedAuthority> list = new ArrayList<>();
        for (Role role : roles) {
            list.add(new SimpleGrantedAuthority("ROLE_"+role.getRoleName()));
        }
        return list;
    }
}
