package com.hh.service;

import com.hh.domain.Option;

import java.util.List;

/**
 * @description:
 * @author: 98316
 * @date: 2020-02-01 10:24
 */
public interface OptionService {
    //查询所有选项信息
    public List<Option> findAll();

    //根据问题id查询所有选项信息
    public List<Option> findId(Integer id);

    //保存选项信息
    public void saveOption(Option option);

    //修改问卷
    public void update(Option option);

}
