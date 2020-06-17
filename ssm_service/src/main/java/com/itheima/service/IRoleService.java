package com.itheima.service;

import com.itheima.domain.Role;

import java.util.List;

/**
 * @author LiZongXiao
 * @create 2020/6/13 22:21
 */
public interface IRoleService {
    /**
     * 查询全部角色信息
     * @return
     * @throws Exception
     */
    public List<Role> findAll(int page,int szie) throws Exception;
}
