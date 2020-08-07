package com.hh.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.List;

/**
 * @description:
 * @author: 98316
 * @date: 2020-02-02 10:27
 */
@Component
public class AnswerInfo {
    private Integer answer_id;
    private String user_ip;
    private String user_address;
    @JsonFormat(pattern = "yyyy-MM-dd",timezone = "GMT+8")
    private Date create_date;
    private Paper paper;
    private List<OptionAnswer> optionAnswers;

    public List<OptionAnswer> getOptionAnswers() {
        return optionAnswers;
    }

    public void setOptionAnswers(List<OptionAnswer> optionAnswers) {
        this.optionAnswers = optionAnswers;
    }

    public Integer getAnswer_id() {
        return answer_id;
    }

    public void setAnswer_id(Integer answer_id) {
        this.answer_id = answer_id;
    }

    public Paper getPaper() {
        return paper;
    }

    public void setPaper(Paper paper) {
        this.paper = paper;
    }

    public String getUser_ip() {
        return user_ip;
    }

    public void setUser_ip(String user_ip) {
        this.user_ip = user_ip;
    }

    public String getUser_address() {
        return user_address;
    }

    public void setUser_address(String user_address) {
        this.user_address = user_address;
    }

    public Date getCreate_date() {
        return create_date;
    }

    public void setCreate_date(Date create_date) {
        this.create_date = create_date;
    }

    @Override
    public String toString() {
        return "AnswerInfo{" +
                "answer_id=" + answer_id +
                ", user_ip='" + user_ip + '\'' +
                ", user_address='" + user_address + '\'' +
                ", create_date=" + create_date +
                ", paper=" + paper +
                ", optionAnswers=" + optionAnswers +
                '}';
    }
}
