package com.itheima.dao;

import com.itheima.domain.Orders;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author LiZongXiao
 * @create 2020/5/26 19:23
 */
public interface IOrdersDao {
    /**
     * 订单全部查询，模糊查询
     * @param fuzzyName
     * @return
     * @throws Exception
     */
    public List<Orders> findAll(@Param("fuzzyName") String fuzzyName) throws Exception;
}
