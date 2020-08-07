package com.hh.domain;

import org.springframework.stereotype.Component;

/**
 * @description:
 * @author: 98316
 * @date: 2020-02-02 10:37
 */
@Component
public class OptionAnswer {
    private Integer ao_id;
    private Integer option_id;
    private Integer question_id;
    private String content;
    private AnswerInfo answerInfo;

    public Integer getQuestion_id() {
        return question_id;
    }

    public void setQuestion_id(Integer question_id) {
        this.question_id = question_id;
    }

    public AnswerInfo getAnswerInfo() {
        return answerInfo;
    }

    public void setAnswerInfo(AnswerInfo answerInfo) {
        this.answerInfo = answerInfo;
    }

    public Integer getAo_id() {
        return ao_id;
    }

    public void setAo_id(Integer ao_id) {
        this.ao_id = ao_id;
    }

    public Integer getOption_id() {
        return option_id;
    }

    public void setOption_id(Integer option_id) {
        this.option_id = option_id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Override
    public String toString() {
        return "OptionAnswer{" +
                "ao_id=" + ao_id +
                ", option_id=" + option_id +
                ", question_id=" + question_id +
                ", content='" + content + '\'' +
                ", answerInfo=" + answerInfo +
                '}';
    }
}
