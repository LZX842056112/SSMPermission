package com.itheima.web;

import com.github.pagehelper.PageInfo;
import com.itheima.domain.Product;
import com.itheima.service.IProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

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
     * 产品删除
     * @param id
     * @return
     */
    @RequestMapping("/deleteById.do")
    public String deleteById(@RequestParam(value = "id",required = false) String id) throws Exception {
        productService.deleteById(id);
        return "redirect:findAll.do";
    }

    /**
     * 修改产品信息
     * @param product
     * @return
     * @throws Exception
     */
    @RequestMapping("/updateProduct.do")
    public String updateProduct(Product product) throws Exception {
        productService.updateProduct(product);
        return "redirect:findAll.do";
    }

    /**
     * 根据id查询产品信息
     * @param id
     * @return
     * @throws Exception
     */
    @RequestMapping("/findById.do")
    public ModelAndView findById(@RequestParam(value = "id",required = false) String id) throws Exception{
        ModelAndView mv = new ModelAndView();
        Product productById = productService.findById(id);
        mv.addObject("productById",productById);
        mv.setViewName("product-update");
        return mv;
    }

    /**
     * 添加产品信息
     * @param product
     * @return
     * @throws Exception
     */
    @RequestMapping("/addProduct.do")
    public String addProduct(Product product) throws Exception{
        Product productByNum = productService.findByNum(product.getProductNum());
        if (productByNum == null){
            productService.addProduct(product);
        }
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
