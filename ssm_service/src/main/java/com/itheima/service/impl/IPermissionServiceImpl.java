package com.itheima.service.impl;

import com.github.pagehelper.PageHelper;
import com.itheima.dao.IPermissionDao;
import com.itheima.dao.IProductDao;
import com.itheima.domain.Permission;
import com.itheima.service.IPermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author LiZongXiao
 * @create 2020/6/18 17:42
 */
@Service
public class IPermissionServiceImpl implements IPermissionService {
    @Autowired
    IPermissionDao permissionDao;

    @Override
    public List<Permission> findAll(int page, int size) throws Exception {
        PageHelper.startPage(page, size);
       return permissionDao.findAll();
    }
}
