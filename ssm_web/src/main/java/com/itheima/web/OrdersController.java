package com.itheima.web;

import com.github.pagehelper.PageInfo;
import com.itheima.domain.Member;
import com.itheima.domain.Orders;
import com.itheima.domain.Product;
import com.itheima.service.IMemberService;
import com.itheima.service.IOrdersService;
import com.itheima.service.IProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * @author LiZongXiao
 * @create 2020/5/26 19:21
 */
@Controller
@RequestMapping("/orders")
public class OrdersController {
    @Autowired
    IOrdersService ordersService;
    @Autowired
    IProductService productService;
    @Autowired
    IMemberService memberService;

    /**
     * 订单添加
     * @param orders
     * @return
     * @throws Exception
     */
    @RequestMapping("/addOrders.do")
    public String addOrders(Orders orders,@RequestParam(name = "productId",required = true) String productId,@RequestParam(name = "memberId", required = true) String memberId) throws Exception {
        if (orders.getOrderNum() != null && orders.getOrderNum() != "" && orders.getOrderNum().length() > 0){
            String orderNum = ordersService.findByNum(orders.getOrderNum());
            if (orderNum == null){
                Product product = productService.findById(productId);
                Member member = memberService.findById(memberId);
                orders.setProduct(product);
                orders.setMember(member);
                ordersService.addOrders(orders);
            }
        }
        return "redirect:findAll.do";
    }

    /**
     * 订单添加前查询产品和会员信息
     * @return
     * @throws Exception
     */
    @RequestMapping("/selectproAndMen.do")
    public ModelAndView selectproAndMen() throws Exception {
        ModelAndView mv = new ModelAndView();
        List<Product> productList = productService.findAll(0, 0, "");
        List<Member> memberList = memberService.findAll();
        mv.addObject("productList",productList);
        mv.addObject("memberList",memberList);
        mv.setViewName("orders-add");
        return mv;
    }

    /**
     * 查询订单全部信息，模糊查询
     * @param page
     * @param size
     * @param fuzzyName
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/findAll.do",produces = "text/html;charset=UTF-8")
    public ModelAndView findAll(@RequestParam(value = "page",defaultValue = "1",required = false) String page,@RequestParam(value = "size",defaultValue = "4",required = false) String size,@RequestParam(value = "fuzzyName",defaultValue = "",required = false) String fuzzyName) throws Exception {
        ModelAndView mv = new ModelAndView();
        List<Orders> ordersList = ordersService.findAll(Integer.parseInt(page), Integer.parseInt(size),fuzzyName);
        PageInfo pageInfo = new PageInfo(ordersList);
        mv.addObject("ordersList",ordersList);
        mv.addObject("fuzzyName",fuzzyName);
        mv.addObject("pageInfo",pageInfo);
        mv.setViewName("orders-list");
        return mv;
    }
}