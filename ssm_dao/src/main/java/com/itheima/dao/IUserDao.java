package com.itheima.dao;

import com.itheima.domain.UserInfo;

/**
 * @author LiZongXiao
 * @create 2020/6/4 22:30
 */
public interface IUserDao {

    /**
     * 根据username查询用户信息
     * @param username
     * @return
     * @throws Exception
     */
    public UserInfo findByUserName(String username) throws Exception;
    
}
