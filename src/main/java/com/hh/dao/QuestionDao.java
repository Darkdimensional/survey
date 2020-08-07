package com.hh.dao;

import com.hh.domain.Question;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.mapping.FetchType;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @description:
 * @author: 98316
 * @date: 2020-02-01 10:08
 */
@Repository
public interface QuestionDao {
    //查询所有问卷信息
    @Select("select * from question")
    public List<Question> findAll();

    //根据问卷id查询所有问题查询信息
    /*@Select("select * from question where paper_id = #{id} order by question_sort asc")
    public List<Question> findId(Integer id);*/
    @Select("select * from question where paper_id = #{id} order by question_sort asc")
    @Results(id = "questionMap",value = {
            @Result(id = true,property = "question_id",column = "question_id"),
            @Result(property = "options",column = "question_id",many = @Many(select = "com.hh.dao.OptionDao.findId",fetchType = FetchType.EAGER))
    })
    public List<Question> findId(Integer id);

    //保存问题信息
    @Insert("insert into question (paper_id,question_type,question_name,required_flag,question_sort) values (#{paper.paper_id},#{question_type},#{question_name},#{required_flag},#{question_sort});")
    @Options(useGeneratedKeys = true, keyProperty = "question_id",keyColumn = "question_id")
    public void saveQuestion(Question question);


    //修改问题信息
    @Update("update question set question_name = #{question_name} where question_id = #{question_id}")
    public void update(Question question);
}
