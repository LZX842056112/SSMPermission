package com.itheima.dao;

import com.itheima.domain.Permission;

import java.util.List;

/**
 * @author LiZongXiao
 * @create 2020/6/18 17:43
 */
public interface IPermissionDao {

    /**
     * 查询全部权限信息
     * @return
     * @throws Exception
     */
    public List<Permission> findAll() throws Exception;
}
