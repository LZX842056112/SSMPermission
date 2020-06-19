package com.itheima.service;

import com.itheima.domain.Permission;

import java.util.List;

/**
 * @author LiZongXiao
 * @create 2020/6/18 17:41
 */
public interface IPermissionService {
    /**
     * 查询全部权限信息
     * @param page
     * @param size
     * @return
     * @throws Exception
     */
    public List<Permission> findAll(int page,int size) throws Exception;
}
