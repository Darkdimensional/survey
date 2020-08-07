package com.hh.dao;

import com.hh.domain.AnswerInfo;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.mapping.FetchType;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @description:
 * @author: 98316
 * @date: 2020-02-03 0:55
 */
@Repository
public interface AnswerInfoDao {

    @Insert("insert into answer_info (user_ip,user_address,paper_id,create_date) values (#{user_ip},#{user_address},#{paper.paper_id},#{create_date});")
    @Options(useGeneratedKeys = true, keyProperty = "answer_id",keyColumn = "answer_id")
    public void saveAnswerInfo(AnswerInfo answerInfo);

    @Select("select count(*) from answer_info where Paper_id = #{id}")
    public Integer findCount(Integer id);

    @Select("select * from answer_info where Paper_id = #{id}")
    public List<AnswerInfo> findPaperId(Integer id);

    @Select("select * from answer_info where answer_id = #{id}")
    @Results(id = "answerMap",value = {
            @Result(id = true,property = "answer_id",column = "answer_id"),
            @Result(property = "paper",column = "paper_id",one = @One(select = "com.hh.dao.PaperDao.findId",fetchType= FetchType.EAGER)),
            @Result(property = "optionAnswers",column = "answer_id",many = @Many(select = "com.hh.dao.OptionAnswerDao.findId",fetchType=FetchType.EAGER))
    })
    public AnswerInfo findId(Integer id);
}
