package com.hh.service.impl;

import com.hh.dao.AnswerInfoDao;
import com.hh.domain.AnswerInfo;
import com.hh.service.AnswerInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @description:
 * @author: 98316
 * @date: 2020-02-03 0:53
 */
@Service("AnswerInfoService")
public class AnswerInfoServiceImpl implements AnswerInfoService {
    @Autowired
    private AnswerInfoDao answerInfoDao;

    @Override
    public void saveAnswerInfo(AnswerInfo answerInfo) {
        answerInfoDao.saveAnswerInfo(answerInfo);
    }

    @Override
    public Integer findCount(Integer id) {
        return answerInfoDao.findCount(id);
    }

    @Override
    public List<AnswerInfo> findPaperId(Integer id) {
        return answerInfoDao.findPaperId(id);
    }

    @Override
    public AnswerInfo findId(Integer id) {
        return answerInfoDao.findId(id);
    }
}
