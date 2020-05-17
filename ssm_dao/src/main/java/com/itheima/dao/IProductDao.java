package com.itheima.dao;

import com.itheima.domain.Product;

import java.util.List;

/**
 * @author LiZongXiao
 * @create 2020/5/15 19:44
 */
public interface IProductDao {

    /**
     * 查询全部产品信息
     * @return
     * @throws Exception
     */
    public List<Product> findAll() throws Exception;
}
