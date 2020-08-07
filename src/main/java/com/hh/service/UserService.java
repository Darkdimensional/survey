package com.hh.service;

import com.hh.domain.User;

import java.util.List;

/**
 * @description:
 * @author: 98316
 * @date: 2020-04-20 16:45
 */
public interface UserService {
    //查询所有用户信息
    public List<User> findAll();

    //保存用户信息
    public Integer saveUser(User user);

    //根据用户名查询用户
    public User findByName(String name);

    public void delete(Integer id);

    public void update(User user);
}
