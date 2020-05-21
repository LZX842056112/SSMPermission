package com.itheima.dao;

import com.itheima.domain.Product;

import java.util.List;

/**
 * @author LiZongXiao
 * @create 2020/5/15 19:44
 */
public interface IProductDao {

    /**
     * 根据productNum查询产品信息
     * @param productNum
     * @return
     * @throws Exception
     */
    public Product findByNum(String productNum) throws Exception;

    /**
     * 添加产品信息
     * @param product
     * @throws Exception
     */
    public void addProduct(Product product) throws Exception;

    /**
     * 查询全部产品信息
     * @return
     * @throws Exception
     */
    public List<Product> findAll() throws Exception;
}
