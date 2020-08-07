package com.hh.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.List;

/**
 * @description:
 * @author: 98316
 * @date: 2020-01-30 9:02
 */
@Component
public class Paper {
   private Integer paper_id;
   private String title;
    @JsonFormat(pattern = "yyyy-MM-dd",timezone = "GMT+8")
   private Date create_time;
   private char status;
   private User user;
   private List<Question> questions;
   private List<AnswerInfo> answerInfos;

    public List<AnswerInfo> getAnswerInfos() {
        return answerInfos;
    }

    public void setAnswerInfos(List<AnswerInfo> answerInfos) {
        this.answerInfos = answerInfos;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public List<Question> getQuestions() {
        return questions;
    }

    public void setQuestions(List<Question> questions) {
        this.questions = questions;
    }

    public Integer getPaper_id() {
        return paper_id;
    }

    public void setPaper_id(Integer paper_id) {
        this.paper_id = paper_id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Date getCreate_time() {
        return create_time;
    }

    public void setCreate_time(Date create_time) {
        this.create_time = create_time;
    }

    public char getStatus() {
        return status;
    }

    public void setStatus(char status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Paper{" +
                "paper_id=" + paper_id +
                ", title='" + title + '\'' +
                ", create_time=" + create_time +
                ", status=" + status +
                ", user=" + user +
                ", questions=" + questions +
                ", answerInfos=" + answerInfos +
                '}';
    }
}
