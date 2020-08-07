package com.hh.dao;

import com.hh.domain.Paper;
import com.hh.domain.Question;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.mapping.FetchType;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @description:
 * @author: 98316
 * @date: 2020-02-01 1:44
 */
@Repository
public interface PaperDao {

    //查询所有问卷信息
    @Select("select * from paper where del = 1")
    public List<Paper> findAll();

    //根据id查询问卷
    /*@Select("select * from paper where paper_id = #{id} and del = 1")
    public Paper findId(Integer id);*/
   @Select("select * from paper where paper_id = #{id}")
    @Results(id = "paperMap",value = {
            @Result(id = true,property = "paper_id",column = "paper_id"),
            @Result(property = "questions",column = "paper_id",many = @Many(select = "com.hh.dao.QuestionDao.findId",fetchType=FetchType.EAGER))
    })
    public Paper findId(Integer id);

    //查询答案
    @Select("select * from paper where paper_id = #{id}")
    public Paper findAnswerCount(Integer id);

    //查询发布的问卷
    @Select("select * from paper where status = 1 and del = 1")
    public List<Paper> findStatus();

    //查询用户所以问卷
    @Select("select * from paper where user_id = #{user_id} and del = 1")
    public List<Paper> findUserId(Integer user_id);

    //保存用户信息
    @Insert("insert into paper (title,create_time,status,user_id) values (#{title},#{create_time},#{status},#{user.user_id});")
    @Options(useGeneratedKeys = true, keyProperty = "paper_id",keyColumn = "paper_id")
    public void savePaper(Paper paper);

    //删除问卷
    @Update("update paper set del = 0 where paper_id = #{id}")
    public void delete(Integer id);

    //修改问卷
    @Update("update paper set title = #{title} where paper_id = #{paper_id}")
    public void update(Paper paper);
}
