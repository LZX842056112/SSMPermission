package com.itheima.service.impl;

import com.github.pagehelper.PageHelper;
import com.itheima.dao.IRoleDao;
import com.itheima.domain.Role;
import com.itheima.service.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

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
