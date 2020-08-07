package com.hh.dao;

import com.hh.domain.OptionAnswer;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @description:
 * @author: 98316
 * @date: 2020-02-03 1:18
 */
@Repository
public interface OptionAnswerDao {

    //保存选项答案信息
    @Insert("insert into answer_option (answer_id,option_id,content,question_id) values (#{answerInfo.answer_id},#{option_id},#{content},#{question_id});")
    public void saveOptionAnswer(OptionAnswer optionAnswer);

    @Select("select * from answer_option where answer_id = #{id}")
    public List<OptionAnswer> findId(Integer id);

    @Select("select count(*) from answer_option where option_id = #{id}")
    public Integer findCount(Integer id);

    @Select("select content from answer_option where question_id = #{id}")
    public List<String> findTextAnswer(Integer id);
}
