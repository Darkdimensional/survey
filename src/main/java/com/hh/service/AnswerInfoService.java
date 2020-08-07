package com.hh.service;

import com.hh.domain.AnswerInfo;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @description:
 * @author: 98316
 * @date: 2020-02-02 22:21
 */
@Repository
public interface AnswerInfoService {

    //保存问卷信息
    public void saveAnswerInfo(AnswerInfo answerInfo);

    //查询答案数量
    public Integer findCount(Integer id);

    //查询问卷答案
    public List<AnswerInfo> findPaperId(Integer id);

    //查询一张答案
    public AnswerInfo findId(Integer id);
}
