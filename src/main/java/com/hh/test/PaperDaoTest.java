package com.hh.test;

import com.hh.dao.PaperDao;
import com.hh.domain.Paper;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @description:
 * @author: 98316
 * @date: 2020-02-08 17:54
 */
public class PaperDaoTest extends BookTest{
    @Autowired
    private PaperDao paperDao;

    @Test
    public void findDiTest(){
        System.out.println(paperDao.findId(21));
    }
}
