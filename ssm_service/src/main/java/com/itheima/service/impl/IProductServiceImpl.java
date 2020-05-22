package com.itheima.service.impl;

import com.github.pagehelper.PageHelper;
import com.itheima.dao.IProductDao;
import com.itheima.domain.Product;
import com.itheima.service.IProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

/**
 * @author LiZongXiao
 * @create 2020/5/15 19:47
 */
@Service
@Transactional
public class IProductServiceImpl implements IProductService {

    @Autowired
    private IProductDao productDao;

    /**
     * 修改产品信息
     * @param product
     * @throws Exception
     */
    @Override
    public void updateProduct(Product product) throws Exception {
        productDao.updateProduct(product);
    }

    /**
     * 根据id查询产品信息
     * @param id
     * @return
     * @throws Exception
     */
    @Override
    public Product findById(String id) throws Exception {
        return productDao.findById(id);
    }

    /**
     * 根据productNum查询产品信息
     * @param productNum
     * @return
     * @throws Exception
     */
    @Override
    public Product findByNum(String productNum) throws Exception {
        if (productNum != null){
            Product product = productDao.findByNum(productNum);
            if (product != null){
                return product;
            }
        }
        return null;
    }

    /**
     * 添加产品信息
     * @param product
     * @throws Exception
     */
    @Override
    public void addProduct(Product product) throws Exception {
        //获取32位UUID大写字符串
        String replace = UUID.randomUUID().toString().replace("-", "").toUpperCase();
        product.setId(replace);
        productDao.addProduct(product);
    }

    /**
     * 查询全部产品信息
     * @return
     * @throws Exception
     */
    @Override
    public List<Product> findAll(int page,int size) throws Exception {
        //分页
        PageHelper.startPage(page,size);
        return productDao.findAll();
    }
}
