package com.lyt.sample.chifan.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.lyt.sample.chifan.domain.Order;
import com.lyt.sample.chifan.repository.OrderDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.*;


/**
 * Created by liuyatao on 16-4-24.
 */
@Controller
@RequestMapping("/order")
public class OrderController {

    @Autowired
    private OrderDao orderDao;
    /**
     * 充值 或者消费
     * @param type 类型 0表示充值 1表示消费
     * @param Users 要充值的用户名
     * @param moeny 要充值的的金钱
     * @return
     */
    @RequestMapping("/order")
    @ResponseBody
    public Object charge(Integer type,@RequestParam(value = "String[] Users") String[] Users,@RequestParam(value = "Float[] money")Float[] moeny){
        List<Order> orderList=new ArrayList<>();
        JSONObject jsonObject=new JSONObject();
        Map map=new HashMap();
        JSON.DEFFAULT_DATE_FORMAT="yyyy-MM-dd";
        for (int i=0;i<Users.length;i++){
            Order order=new Order();
            order.setDate(new Date());
            order.setUserName(Users[i]);
            order.setNumber(moeny[i]);
            order.setType(type);
            orderList.add(order);
        }
        try {
            orderDao.save(orderList);
            map.put("msg","success");
        }catch (Exception e){
            map.put("msg",e.getMessage());
        }
        return jsonObject.toJSONString();
    }

    /**
     * 获取当前剩余总额（总充值-总消费）
     * @return
     */
    @RequestMapping("/sum")
    @ResponseBody
    public Object sum(){
        JSONObject jsonObject=new JSONObject();
        try{
            Float currentNUmber=orderDao.getTotalCharge()-orderDao.getTotalConsume();
            jsonObject.put("msg","success");
            jsonObject.put("data",currentNUmber);
        }catch (Exception e){
            jsonObject.put("msg",e.getMessage());
        }
        return jsonObject.toJSONString();
    }

    /**
     * 根据用户名获取
     * @param userName 用户名
     * @return
     */
    @RequestMapping("/personalSum")
    @ResponseBody
    public Object personalSum(String userName){
        return null;

    }

}
