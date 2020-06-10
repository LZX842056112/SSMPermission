package com.itheima.dao;

import com.itheima.domain.UserInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author LiZongXiao
 * @create 2020/6/4 22:30
 */
public interface IUserDao {

    /**
     * 查询全部用户信息，模糊查询
     * @param fuzzyName
     * @return
     * @throws Exception
     */
    public List<UserInfo> findAll(@Param("fuzzyName") String fuzzyName)throws Exception;

    /**
     * 根据username查询用户信息
     * @param username
     * @return
     * @throws Exception
     */
    public UserInfo findByUserName(String username) throws Exception;
    
}
