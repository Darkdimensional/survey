package com.hh.service;

import com.hh.domain.Question;

import java.util.List;

/**
 * @description:
 * @author: 98316
 * @date: 2020-02-01 10:05
 */
public interface QuestionService {
    //查询全部问题信息
    public List<Question> findAll();

    //根据问卷id查询所有问题查询信息
    public List<Question> findId(Integer id);

    //保存问题信息
    public void saveQuestion(Question question);

    //修改问卷
    public void update(Question question);
}
