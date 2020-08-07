package com.hh.controller;

import com.hh.domain.AnswerInfo;
import com.hh.domain.OptionAnswer;
import com.hh.domain.Paper;
import com.hh.service.AnswerInfoService;
import com.hh.service.OptionAnswerService;
import com.hh.service.PaperService;
import com.hh.util.AjaxResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @description:
 * @author: 98316
 * @date: 2020-02-02 22:18
 */
@Controller
@RequestMapping("/answer")
public class AnswerController {

    @Autowired
    private AnswerInfoService answerInfoService;
    @Autowired
    private OptionAnswerService optionAnswerService;
    @Autowired
    private PaperService paperService;

    @ResponseBody
    @RequestMapping("/save")
    //答案添加
    public Object save(@RequestBody AnswerInfo answerInfo){
        //插入答案主表信息
        answerInfoService.saveAnswerInfo(answerInfo);
        Integer answer_id = answerInfo.getAnswer_id();
        //插入选项答案
        AnswerInfo answer = new AnswerInfo();
        answer.setAnswer_id(answer_id);
        List<OptionAnswer> optionAnswers = answerInfo.getOptionAnswers();
        for (int i = 0;i < optionAnswers.size(); i++){
            OptionAnswer optionAnswer = optionAnswers.get(i);
            optionAnswer.setAnswerInfo(answer);
            optionAnswerService.saveOptionAnswer(optionAnswer);
        }
        return AjaxResult.createBySuccessMsg("答案提交成功");
    }

    @ResponseBody
    @RequestMapping("/findPaperId")
    public Object findPaperId (Integer id){
        List<AnswerInfo> answerInfos = answerInfoService.findPaperId(id);
        return AjaxResult.createBySuccessData(answerInfos);
    }

    @ResponseBody
    @RequestMapping("/findId")
    public Object findId (Integer id){
        AnswerInfo answerInfo = answerInfoService.findId(id);
        System.out.println(answerInfo);
        return AjaxResult.createBySuccessData(answerInfo);
    }

    @ResponseBody
    @RequestMapping("/findPaperCount")
    //根据问卷Id查询答案数量
    public Object findPaperCount(Integer id){
        Integer count = answerInfoService.findCount(id);
        return AjaxResult.createBySuccessData(count);
    }

    @ResponseBody
    @RequestMapping("/findOptionCount")
    //根据查询选项的答案数量
    public Object findOptionCount(Integer id){
        Integer count = optionAnswerService.findCount(id);
        return AjaxResult.createBySuccessData(count);
    }

    @ResponseBody
    @RequestMapping("/findTextAnswer")
    //根据查询文本答案
    public Object findTextAnswer(Integer id){
        List<String> contents = optionAnswerService.findTextAnswer(id);
        return AjaxResult.createBySuccessData(contents);
    }

}
