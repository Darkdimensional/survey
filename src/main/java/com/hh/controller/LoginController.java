package com.hh.controller;

import com.hh.util.AjaxResult;
import com.hh.domain.User;
import com.hh.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/**
 * @description:
 * @author: 98316
 * @date: 2020-04-25 19:13
 */
@Controller
@RequestMapping("/login")
public class LoginController {

    @Autowired
    private UserService userService;
    @Autowired
    private AjaxResult arlt;
    @Autowired
    private User user;

    @RequestMapping("/user")
    @ResponseBody
    public Object userLogin(User user1, HttpSession session){
        user = userService.findByName(user1.getUsername());
        if(user != null && user1.getPassword().equals(user.getPassword())){
            session.setAttribute("user_session",user);
            return AjaxResult.createBySuccessMsg("登录成功");
        }else {
            arlt.setSuccess(false);
        }
        return arlt;
    }

    @RequestMapping("/logout")
    public Object loguot(HttpSession session){
        session.invalidate();
        return AjaxResult.createBySuccessMsg("登录成功");
    }
}
