package com.itheima.service.impl;

import com.github.pagehelper.PageHelper;
import com.itheima.dao.IRoleDao;
import com.itheima.domain.Role;
import com.itheima.service.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

/**
 * @author LiZongXiao
 * @create 2020/6/13 22:21
 */
@Service
@Transactional
public class IRoleServiceImpl implements IRoleService {

    @Autowired
    IRoleDao roleDao;

    /**
     * 新建角色
     * @param role
     * @throws Exception
     */
    @Override
    public void addUser(Role role) throws Exception {
        //获取32位UUID大写字符串
        String replace = UUID.randomUUID().toString().replace("-", "").toUpperCase();
        role.setId(replace);
        roleDao.addUser(role);
    }

    /**
     * 查询全部角色信息
     * @return
     * @throws Exception
     */
    @Override
    public List<Role> findAll(int page,int szie) throws Exception {
        //分页
        PageHelper.startPage(page,szie);
        return roleDao.findAll();
    }
}
