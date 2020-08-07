package com.hh.service;

import com.hh.domain.Paper;
import com.hh.domain.Question;

import java.util.List;

/**
 * @description:
 * @author: 98316
 * @date: 2020-02-01 1:41
 */
public interface PaperService {

    //查询所有问卷信息
    public List<Paper> findAll();

    //根据Id查询问卷信息
    public Paper findId(Integer id);

    //根据Id查询问卷信息
    public Paper findAnswerCount(Integer id);

    //查询发布的问卷
    public List<Paper> findStatus();

    //查询用户所以问卷
    public List<Paper> findUserId(Integer user_id);

    //保存问卷信息
    public void savePaper(Paper paper);

    //删除问卷
    public void delete(Integer id);

    //修改问卷
    public void update(Paper paper);

}
