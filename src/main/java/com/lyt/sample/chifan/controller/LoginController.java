package com.lyt.sample.chifan.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by liuyatao on 16-4-24.
 */
@Controller
public class LoginController {

    @RequestMapping("/login")
    public ModelAndView login(){
        return new ModelAndView("login");
    }

    @RequestMapping("/")
    public ModelAndView Index(){
        return new ModelAndView("index");
    }
}
