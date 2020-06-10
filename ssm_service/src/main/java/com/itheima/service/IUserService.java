package com.itheima.service;

import com.itheima.domain.UserInfo;
import org.springframework.security.core.userdetails.UserDetailsService;

import java.util.List;

/**
 * @author LiZongXiao
 * @create 2020/6/4 22:27
 */
public interface IUserService extends UserDetailsService {
    /**
     * 查询全部用户信息，模糊查询
     * @param page
     * @param size
     * @param fuzzyName
     * @return
     * @throws Exception
     */
    public List<UserInfo> findAll(int page,int size,String fuzzyName)throws Exception;
}
