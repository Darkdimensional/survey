package com.hh.controller;

import com.hh.domain.Option;
import com.hh.domain.Paper;
import com.hh.domain.Question;
import com.hh.domain.User;
import com.hh.service.OptionService;
import com.hh.service.PaperService;
import com.hh.service.QuestionService;
import com.hh.util.AjaxResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * @description:
 * @author: 98316
 * @date: 2020-02-30 9:11
 */
@Controller
@RequestMapping("/paper")
public class PaperController {

    @Autowired
    private PaperService paperService;
    @Autowired
    private QuestionService questionService;
    @Autowired
    private OptionService optionService;


    //查询所有问卷信息
    @RequestMapping("/findAll")
    @ResponseBody
    public Object findAll(){
        List<Paper> papers = paperService.findAll();
        return AjaxResult.createBySuccessData(papers);
    }

    //查询所有问卷信息
    @RequestMapping("/delete")
    @ResponseBody
    public Object delete(Integer id){
        paperService.delete(id);
        return  AjaxResult.createBySuccessMsg("问卷删除成功");
    }

    @ResponseBody
    @RequestMapping("/findId")
    public Object findId(Integer id){
        Paper paper = paperService.findId(id);
        /*List<Question> questions = questionService.findId(id);
        for (int i = 0; i < questions.size(); i++){
            Question question = questions.get(i);
            List<Option> options = optionService.findId(question.getQuestion_id());
            question.setOptions(options);
        }
        paper.setQuestions(questions);*/
        return AjaxResult.createBySuccessData(paper);
    }

    @ResponseBody
    @RequestMapping("/findUserId")
    //查询用户所以的问卷
    public Object findUserId(Integer user_id){
        List<Paper> papers = paperService.findUserId(user_id);
        return AjaxResult.createBySuccessData(papers);
    }

    @ResponseBody
    @RequestMapping("/findStatus")
    //查询所以发布的问卷
    public Object findStatus(){
        List<Paper> papers = paperService.findStatus();
        return AjaxResult.createBySuccessData(papers);
    }


    @ResponseBody
    @RequestMapping("/save")
    //问卷添加
    public Object save(@RequestBody Paper paper){
        //增加问卷基础信息
        paperService.savePaper(paper);
        Integer paper_id = paper.getPaper_id();
        //增加问题
        Question question;
        Paper pa = new Paper();
        pa.setPaper_id(paper_id);
        List<Question> questions = paper.getQuestions();
        for (int i = 0;i < questions.size(); i++){
            question = questions.get(i);
            question.setPaper(pa);
            questionService.saveQuestion(question);
            Integer question_id =question.getQuestion_id();
            //增加选项
            List<Option> options = question.getOptions();
            Option option;
            Question qu = new Question();
            qu.setQuestion_id(question_id);
            for (int j = 0; j < options.size(); j++){
                option = options.get(j);
                option.setQuestion(qu);
                optionService.saveOption(option);
            }
        }
        return AjaxResult.createBySuccessMsg("问卷提交成功");
    }


    @ResponseBody
    @RequestMapping("/update")
    //问卷添加
    public Object update(@RequestBody Paper paper){
        //修改问卷基础信息
        paperService.update(paper);
        //修改问题
        Question question;
        List<Question> questions = paper.getQuestions();
        for (int i = 0;i < questions.size(); i++){
            question = questions.get(i);
            questionService.update(question);
            //修改选项
            List<Option> options = question.getOptions();
            Option option;
            for (int j = 0; j < options.size(); j++){
                option = options.get(j);
                optionService.update(option);
            }
        }
        return AjaxResult.createBySuccessMsg("问卷修改成功");
    }
}
