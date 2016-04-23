package com.lyt.love.zyf.chifan.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Administrator on 2016/4/23.
 */
@Controller
@RequestMapping("/")
public class Test {
    @RequestMapping("/")
    public String Index(){
        return "test";
    }
}
