package com.hh.service;

import com.hh.domain.OptionAnswer;

import java.util.List;

/**
 * @description:
 * @author: 98316
 * @date: 2020-02-03 1:14
 */
public interface OptionAnswerService {
    //保存选项答案信息
    public void saveOptionAnswer(OptionAnswer optionAnswer);

    //查询选项个数
    public Integer findCount(Integer id);

    //返回文本答案
    public List<String> findTextAnswer(Integer id);
}
