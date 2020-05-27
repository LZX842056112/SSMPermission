package com.itheima.service;

import com.itheima.domain.Orders;

import java.util.List;

/**
 * @author LiZongXiao
 * @create 2020/5/26 19:22
 */
public interface IOrdersService {
    /**
     * 订单全部查询，模糊查询
     * @param page
     * @param size
     * @param fuzzyName
     * @return
     * @throws Exception
     */
    public List<Orders> findAll(int page,int size,String fuzzyName) throws Exception;
}
