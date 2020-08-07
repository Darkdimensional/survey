package com.hh.service.impl;

import com.hh.dao.PaperDao;
import com.hh.domain.Paper;
import com.hh.domain.Question;
import com.hh.service.PaperService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @description:
 * @author: 98316
 * @date: 2020-02-01 1:43
 */
@Service("PaperService")
public class PaperServiceImpl implements PaperService {

    @Autowired
    private PaperDao paperDao;

    @Override
    public List<Paper> findAll() {
        return paperDao.findAll();
    }

    @Override
    public Paper findId(Integer id) {
        return paperDao.findId(id);
    }

    @Override
    public Paper findAnswerCount(Integer id) {
        return paperDao.findAnswerCount(id);
    }

    @Override
    public List<Paper> findStatus() {
        return paperDao.findStatus();
    }

    @Override
    public List<Paper> findUserId(Integer user_id) {
        return paperDao.findUserId(user_id);
    }

    @Override
    public void savePaper(Paper paper) {
        paperDao.savePaper(paper);
    }

    @Override
    public void delete(Integer id) {
        paperDao.delete(id);
    }

    @Override
    public void update(Paper paper) {
        paperDao.update(paper);
    }
}
