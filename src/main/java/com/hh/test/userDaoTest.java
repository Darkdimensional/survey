package com.hh.test;

import com.hh.dao.UserDao;
import com.hh.domain.User;
import org.junit.Test;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
import java.util.logging.Logger;

/**
 * @description:
 * @author: 98316
 * @date: 2020-04-21 0:19
 */
public class userDaoTest extends BookTest{
    //声明日志管理，日志记录
    /*@SuppressWarnings("unused")
    private Logger logger = LoggerFactory.getLogger(this.getClass());
*/
    //注入BookDao
    @Autowired
    private UserDao userDao;

    @Test
    public void testSaveUser(){
        User user = new User();
        user.setUsername("hh");
        user.setPassword("111111");
        userDao.saveUser(user);
    }

    @Test
    public void testFindAll(){
        List<User> users = userDao.findAll();
        for(User user : users){
            System.out.println(user);
        }

    }
    @Test
    public void testFindByName(){
        System.out.println(userDao.findByName("zs"));
    }

}
