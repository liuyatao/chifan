package com.lyt.sample.chifan.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.lyt.sample.chifan.domain.*;
import com.lyt.sample.chifan.repository.MainOrderDao;
import com.lyt.sample.chifan.repository.OrderDao;
import com.lyt.sample.chifan.repository.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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

    @Autowired
    private MainOrderDao mainOrderDao;
    @Autowired
    private UserDao userDao;

    /**
     * 充值 或者消费
     *
     * @param type        类型 0表示充值 1表示消费
     * @param Users       要充值、消费的用户名
     * @param moeny       要充值、消费的的金钱
     * @param totoalMoney 充值、消费总金钱
     * @return
     */
    @RequestMapping("/order")
    @ResponseBody
    public Object charge(Integer type, @RequestParam(value = "Users[]") String[] Users, @RequestParam(value = "money[]") Double[] moeny, Double totoalMoney) {

        JSONObject jsonObject = new JSONObject();
        Map map = new HashMap();
        JSON.DEFFAULT_DATE_FORMAT = "yyyy-MM-dd";

        try {
            MainOrder mainOrder = new MainOrder();
            mainOrder.setDate(new Date());
            mainOrder.setMoney(totoalMoney);
            mainOrder.setCategory(type);
            MainOrder saved = mainOrderDao.save(mainOrder);
            List<Theorder> orderList = new ArrayList<>();
            for (int i = 0; i < Users.length; i++) {
                Theorder order = new Theorder();
                order.setUserName(Users[i]);
                order.setNumber(moeny[i]);
                order.setMainId(saved.getId());
                order.setCategory(type);
                orderList.add(order);
            }
            orderDao.save(orderList);
            map.put("msg", "success");
        } catch (Exception e) {
            map.put("msg", e.getMessage());
        }
        return jsonObject.toJSONString(map);
    }

    /**
     * 获取当前剩余总额（总充值-总消费）
     *
     * @return
     */
    @RequestMapping("/sum")
    @ResponseBody
    public Object sum() {
        JSONObject jsonObject = new JSONObject();
        try {
            double totalCharge=mainOrderDao.getTotalCharge()==null?0.0:mainOrderDao.getTotalCharge();
            double totalConsume =mainOrderDao.getTotalConsume() ==null?0.0:mainOrderDao.getTotalConsume();
            double currentNumber = totalCharge-totalConsume;
            jsonObject.put("msg", "success");
            jsonObject.put("data", currentNumber);
        } catch (Exception e) {
            e.printStackTrace();
            jsonObject.put("msg", e.getMessage());
        }
        return jsonObject.toJSONString();
    }

    /**
     * 指定用户名的剩余金额
     *
     * @param userName 用户名
     * @return
     */
    @RequestMapping("/personalSum")
    @ResponseBody
    public Object personalSum(String userName) {
        double remainder = orderDao.getPersonalTotalCharge(userName) - orderDao.getPersonalTotalConsume(userName);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("userName", userName);
        jsonObject.put("remainder", remainder);
        return jsonObject.toJSONString();
    }

    /**
     * 获取所有人的剩余金钱
     *
     * @return
     */
    @RequestMapping(value = "/allPersonalSum", produces = "text/html;charset=UTF-8",method = RequestMethod.POST)
    @ResponseBody
    public Object allPersonalSum() {
        Iterator<User> allUser = userDao.findAll().iterator();
        List<Map> userList = new ArrayList<>();
        while (allUser.hasNext()) {
            User user = allUser.next();
            Map map = new HashMap();
            map.put("id",user.getId());
            map.put("userName", user.getUserName());
            Double personalTotalCharge= orderDao.getPersonalTotalCharge(user.getUserName())==null?0.0:orderDao.getPersonalTotalCharge(user.getUserName());
            Double personalToltalConsume = orderDao.getPersonalTotalConsume(user.getUserName())==null?0.0:orderDao.getPersonalTotalConsume(user.getUserName());
            map.put("remainder",personalTotalCharge-personalToltalConsume);
            userList.add(map);
        }
        JSONObject jsonObject = new JSONObject();
        return jsonObject.toJSONString(userList);
    }

    /**
     * 本月账单
     *
     * @return
     */
    @RequestMapping(value = "/monthOrder",produces = "text/html;charset=UTF-8",method = RequestMethod.POST)
    @ResponseBody
    public Object monthOrder() {
        QMainOrder qMainOrder = QMainOrder.mainOrder;
        Date current = new Date();
        Date before;
        if (current.getMonth() == 0) {
            before = new Date(current.getYear() - 1, 11, current.getDay());
        } else {
            before = new Date(current.getYear(), current.getMonth(), current.getDay());
        }
        Iterator<MainOrder> monthOrder = mainOrderDao.findAll(qMainOrder.date.goe(before)).iterator();

        List<Map> mapList=new ArrayList<>();

        while (monthOrder.hasNext()){
            Map map=new HashMap();
            MainOrder mainOrder=monthOrder.next();
            map.put("money",mainOrder.getMoney());
            map.put("date",mainOrder.getDate());
            map.put("type",mainOrder.getCategory());

            List<String> stringList=new ArrayList<>();
            QTheorder qTheorder=QTheorder.theorder;
            Iterator<Theorder> order = orderDao.findAll(qTheorder.mainId.eq(mainOrder.getId())).iterator();
            while (order.hasNext()){
                stringList.add(order.next().getUserName());
            }
            map.put("users",stringList);
            mapList.add(map);
        }
        JSONObject jsonObject=new JSONObject();
        JSON.DEFFAULT_DATE_FORMAT="yyyy-MM-dd";
        return jsonObject.toJSONString(mapList, SerializerFeature.WriteDateUseDateFormat);
    }
}
