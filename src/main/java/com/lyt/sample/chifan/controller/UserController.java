package com.lyt.sample.chifan.controller;

import com.alibaba.fastjson.JSONObject;
import com.lyt.sample.chifan.domain.User;
import com.lyt.sample.chifan.repository.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * Created by liuyatao on 16-4-24.
 */
@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserDao userDao;

    /**
     * 获取所有用户
     * @return
     */
    @RequestMapping("/allUser")
    public Object getAllUser(){
        JSONObject jsonObject=new JSONObject();
        try{
            Iterator<User> allUser = userDao.findAll().iterator();
            List<User> userList=new ArrayList<>();
            while (allUser.hasNext()){
                userList.add(allUser.next());
            }
            jsonObject.put("msg","success");
            jsonObject.put("data",userList);
        }catch (Exception e){
            jsonObject.put("msg",e.getMessage());
        }
        return jsonObject.toJSONString();
    }

    /**
     * 添加用户
     * @param userName
     * @return
     */
    @RequestMapping("/addUser")
    @ResponseBody
    public Object addUser(String userName){
        User user=new User();
        user.setUserName(userName);
        JSONObject jsonObject=new JSONObject();
        try{
            userDao.save(user);
            jsonObject.put("msg","success");
        }catch (Exception e){
            e.printStackTrace();
            jsonObject.put("msg",e.getMessage());
        }
        return jsonObject.toJSONString();
    }

    /**
     * 删除用户
     * @param id
     * @return
     */
    @RequestMapping("/deleteUser")
    @ResponseBody
    public Object deleteUser(Integer id){
        JSONObject jsonObject=new JSONObject();
        try{
            userDao.delete(id);
            jsonObject.put("msg","success");
        }catch (Exception e){
            jsonObject.put("msg",e.getMessage());
        }
        return jsonObject.toJSONString();
    }

}
