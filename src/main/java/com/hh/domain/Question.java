package com.hh.domain;

import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.List;

/**
 * @description:
 * @author: 98316
 * @date: 2020-01-30 8:57
 */
@Component
public class Question {
    private Integer question_id;
    private char question_type;
    private String question_name;
    private char  required_flag;
    private int question_sort;
    private Paper paper;
    private List<Option> options;

    public Paper getPaper() {
        return paper;
    }

    public void setPaper(Paper paper) {
        this.paper = paper;
    }

    public List<Option> getOptions() {
        return options;
    }

    public void setOptions(List<Option> options) {
        this.options = options;
    }

    public int getQuestion_sort() {
        return question_sort;
    }

    public void setQuestion_sort(int question_sort) {
        this.question_sort = question_sort;
    }

    public Integer getQuestion_id() {
        return question_id;
    }

    public void setQuestion_id(Integer question_id) {
        this.question_id = question_id;
    }

    public char getQuestion_type() {
        return question_type;
    }

    public void setQuestion_type(char question_type) {
        this.question_type = question_type;
    }

    public String getQuestion_name() {
        return question_name;
    }

    public void setQuestion_name(String question_name) {
        this.question_name = question_name;
    }

    public char getRequired_flag() {
        return required_flag;
    }

    public void setRequired_flag(char required_flag) {
        this.required_flag = required_flag;
    }

    @Override
    public String toString() {
        return "Question{" +
                "question_id=" + question_id +
                ", question_type=" + question_type +
                ", question_name='" + question_name + '\'' +
                ", required_flag=" + required_flag +
                ", question_sort=" + question_sort +
                ", paper=" + paper +
                ", options=" + options +
                '}';
    }
}
