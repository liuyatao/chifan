package com.lyt.sample.chifan.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.lyt.sample.chifan.domain.QUser;
import com.lyt.sample.chifan.domain.User;
import com.lyt.sample.chifan.repository.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by Administrator on 2016/4/23.
 */
@Controller
@RequestMapping("/")
public class Test {

    @Autowired
    private UserDao userDao;

    @RequestMapping("/")
    @ResponseBody
    public Object Index(@PageableDefault Pageable pageable){
        JSONObject jsonObject=new JSONObject();
        Page<User> userPage=userDao.findAll(pageable);
        return jsonObject.toJSONString(userPage);
    }

    @RequestMapping("/test2")
    @ResponseBody
    public Object Test2(@PageableDefault Pageable pageable){
        JSONObject jsonObject=new JSONObject();
        QUser qUser=QUser.user;
        Page<User> userPage=userDao.getUserByPage(pageable,qUser.userName.eq("lyt").and(qUser.id.eq(1)));
        return jsonObject.toJSONString(userPage);

    }
}
