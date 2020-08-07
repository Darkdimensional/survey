package com.hh.service.impl;

import com.hh.dao.OptionAnswerDao;
import com.hh.domain.OptionAnswer;
import com.hh.service.OptionAnswerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @description:
 * @author: 98316
 * @date: 2020-02-03 1:16
 */
@Service("OptionAnswerServiceImpl")
public class OptionAnswerServiceImpl implements OptionAnswerService {

    @Autowired
    private OptionAnswerDao optionAnswerDao;
    @Override
    public void saveOptionAnswer(OptionAnswer optionAnswer) {
        optionAnswerDao.saveOptionAnswer(optionAnswer);
    }

    @Override
    public Integer findCount(Integer id) {
        return optionAnswerDao.findCount(id);
    }

    @Override
    public List<String> findTextAnswer(Integer id) {
        return optionAnswerDao.findTextAnswer(id);
    }
}
