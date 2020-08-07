package com.hh.dao;

import com.hh.domain.User;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @description:
 * @author: 98316
 * @date: 2020-01-20 16:41
 */
@Repository
public interface UserDao {

    //查询所有用户信息
    @Select("select * from user where del = 1")
    public List<User> findAll();

    //保存用户信息
    @Insert("insert into user (username,password,email,tel) values (#{username},#{password},#{email},#{tel})")
    public Integer saveUser(User user);

    //根据用户名查询用户信息
    @Select("select * from user where username = #{name}")
    public User findByName(String name);

    @Update("update user set del = 0 where user_id = #{id}")
    public void delete(Integer id);

    @Update("update user set username = #{username} where user_id = #{user_id}")
    public void update(User user);
}
