package com.itheima.service;

import com.itheima.domain.SysLog;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author LiZongXiao
 * @create 2020/6/25 22:05
 */
public interface ISysLogService {
    /**
     * 查询全部日志，模糊查询
     * @param page
     * @param size
     * @param fuzzyName
     * @return
     * @throws Exception
     */
    public List<SysLog> findAll(int page,int size,String fuzzyName) throws Exception;
}
