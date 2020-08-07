package com.hh.controller;

import com.hh.service.UserService;
import com.hh.domain.User;
import com.hh.util.AjaxResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @description:
 * @author: 98316
 * @date: 2020-01-20 16:47
 */
@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    //查询所有用户信息
    @RequestMapping("/findAll")
    @ResponseBody
    public Object findAll(){
        List<User> users = userService.findAll();
        return AjaxResult.createBySuccessData(users);
    }
    //删除用户
    @RequestMapping("/delete")
    @ResponseBody
    public Object delete(Integer id){
        userService.delete(id);
        return  AjaxResult.createBySuccessMsg("用户删除成功");
    }

    //修改用户
    @RequestMapping("/update")
    @ResponseBody
    public Object update(User user){
        userService.update(user);
        return  AjaxResult.createBySuccessMsg("用户修改成功");
    }

    //保存用户信息
    @ResponseBody
    @RequestMapping("/save")
    public Integer save(User user){
        return userService.saveUser(user);
        //return "redirect:findAll"
    }

    //根据用户名查询用户
    @RequestMapping("/findByName")
    @ResponseBody
    public User findByName(String username){
        return userService.findByName(username);
    }

}
