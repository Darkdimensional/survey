package com.hh.controller;

import com.hh.util.AjaxResult;
import com.hh.domain.User;
import com.hh.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @description:
 * @author: 98316
 * @date: 2020-01-25 19:05
 */
@Controller
@RequestMapping("/register")
public class RegisterController {

    @Autowired
    private UserService userService;
    @Autowired
    private AjaxResult arlt;

    //保存用户信息
    @ResponseBody
    @RequestMapping("/save")
    public Object save(User user){
        Integer re = userService.saveUser(user);
        arlt.setSuccess(re == 1);
        return arlt;
        //return "redirect:findAll"
    }

    //根据用户名查询用户
    @RequestMapping("/findByName")
    @ResponseBody
    public Object findByName(String username){
        if (userService.findByName(username) == null){
            arlt.setSuccess(true);
        }else{
            arlt.setSuccess(false);
            //arlt.setMessage("用户已存在");
        }
        return arlt;
    }
}
