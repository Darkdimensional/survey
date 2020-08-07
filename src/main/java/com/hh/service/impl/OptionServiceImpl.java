package com.hh.service.impl;

import com.hh.dao.OptionDao;
import com.hh.domain.Option;
import com.hh.service.OptionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @description:
 * @author: 98316
 * @date: 2020-02-01 10:25
 */
@Service("OptionService")
public class OptionServiceImpl implements OptionService {

    @Autowired
    private OptionDao optionDao;

    @Override
    public List<Option> findAll() {
        return optionDao.findAll();
    }

    @Override
    public List<Option> findId(Integer id) {
        return optionDao.findId(id);
    }

    @Override
    public void saveOption(Option option) {
        optionDao.saveOption(option);
    }

    @Override
    public void update(Option option) {
        optionDao.update(option);
    }
}
