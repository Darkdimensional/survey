package com.hh.service.impl;

import com.hh.dao.QuestionDao;
import com.hh.domain.Question;
import com.hh.service.QuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @description:
 * @author: 98316
 * @date: 2020-02-01 10:05
 */
@Service("QuestionService")
public class QuestionServiceImpl implements QuestionService {

    @Autowired
    private QuestionDao questionDao;

    @Override
    public List<Question> findAll() {
        return questionDao.findAll();
    }

    @Override
    public List<Question> findId(Integer id) {
        return questionDao.findId(id);
    }

    @Override
    public void saveQuestion(Question question) {
        questionDao.saveQuestion(question);
    }

    @Override
    public void update(Question question) {
        questionDao.update(question);
    }
}
