package com.itheima.web;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.itheima.domain.Product;
import com.itheima.service.IProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * @author LiZongXiao
 * @create 2020/5/15 20:46
 */
@Controller
@RequestMapping("/product")
public class ProductController {
    @Autowired
    IProductService productService;

    /**
     * 添加产品信息
     * @param product
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping("/addProduct.do")
    public String addProduct(Product product, HttpServletResponse response) throws Exception{
        Product productByNum = productService.findByNum(product.getProductNum());
        if (productByNum != null){
            response.getWriter().write("<script>alert('商品已经在列表里了，不要重复添加');window.location='findAll.do'; window.close();</script>");
        }
        productService.addProduct(product);
        return "redirect:findAll.do";
    }

    /**
     * 查询全部产品信息
     * @return
     * @throws Exception
     */
    @RequestMapping("/findAll.do")
    public ModelAndView findAll(@RequestParam(value = "page",defaultValue = "1",required = false)Integer page,@RequestParam(value = "size",defaultValue = "4",required = false) Integer size) throws Exception{
        ModelAndView mv = new ModelAndView();
        List<Product> productList = productService.findAll(page.intValue(),size.intValue());
        PageInfo pageInfo = new PageInfo(productList);
        mv.addObject("productList",productList);
        mv.addObject("pageInfo",pageInfo);
        mv.setViewName("product-list");
        return mv;
    }
}
