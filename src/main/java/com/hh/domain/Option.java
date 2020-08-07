package com.hh.domain;

import org.springframework.stereotype.Component;

/**
 * @description:
 * @author: 98316
 * @date: 2020-01-30 9:08
 */
@Component
public class Option {

    private Integer option_id;
    private String option_name;
    private Integer option_sort;
    private Question question;

    public Question getQuestion() {
        return question;
    }

    public void setQuestion(Question question) {
        this.question = question;
    }

    public Integer getOption_sort() {
        return option_sort;
    }

    public void setOption_sort(Integer option_sort) {
        this.option_sort = option_sort;
    }

    public Integer getOption_id() {
        return option_id;
    }

    public void setOption_id(Integer option_id) {
        this.option_id = option_id;
    }

    public String getOption_name() {
        return option_name;
    }

    public void setOption_name(String option_name) {
        this.option_name = option_name;
    }

    @Override
    public String toString() {
        return "Option{" +
                "option_id=" + option_id +
                ", option_name='" + option_name + '\'' +
                ", option_sort=" + option_sort +
                ", question=" + question +
                '}';
    }
}
