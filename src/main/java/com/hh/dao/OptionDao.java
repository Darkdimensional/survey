package com.hh.dao;

import com.hh.domain.Option;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @description:
 * @author: 98316
 * @date: 2020-02-01 10:27
 */
@Repository
public interface OptionDao {

    @Select("select * from `option`")
    public List<Option> findAll();

    //根据问题id查询所有选项信息
    @Select("select * from `option` where question_id = #{id} order by option_sort asc")
    public List<Option> findId(Integer id);

    @Insert("insert into `option` (question_id,option_name,option_sort) values (#{question.question_id},#{option_name},#{option_sort});")
    public void saveOption(Option option);

    @Update("update `option` set option_name = #{option_name} where option_id = #{option_id}")
    public void update(Option option);
}
