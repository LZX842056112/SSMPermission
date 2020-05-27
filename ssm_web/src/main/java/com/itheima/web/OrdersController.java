package com.itheima.web;

import com.github.pagehelper.PageInfo;
import com.itheima.domain.Orders;
import com.itheima.service.IOrdersService;
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
