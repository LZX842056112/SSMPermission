package com.itheima.service.impl;

import com.github.pagehelper.PageHelper;
import com.itheima.dao.IPermissionDao;
import com.itheima.dao.IProductDao;
import com.itheima.domain.Permission;
import com.itheima.service.IPermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

/**
 * @author LiZongXiao
 * @create 2020/6/18 17:42
 */
@Service
public class IPermissionServiceImpl implements IPermissionService {
    @Autowired
    IPermissionDao permissionDao;

    /**
     * 权限添加
     * @param permission
     * @throws Exception
     */
    @Override
    public void addPermission(Permission permission) throws Exception {
        //获取32位UUID大写字符串
        String replace = UUID.randomUUID().toString().replace("-", "").toUpperCase();
        permission.setId(replace);
        permissionDao.addPermission(permission);
    }

    /**
     * 查询全部权限信息
     * @param page
     * @param size
     * @return
     * @throws Exception
     */
    @Override
    public List<Permission> findAll(int page, int size) throws Exception {
        PageHelper.startPage(page, size);
       return permissionDao.findAll();
    }
}
