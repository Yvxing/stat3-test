package com.ujiuye.dao;

import com.ujiuye.pojo.Stucou;
import com.ujiuye.pojo.StucouExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface StucouMapper {
    int countByExample(StucouExample example);

    int deleteByExample(StucouExample example);

    int insert(Stucou record);

    int insertSelective(Stucou record);

    List<Stucou> selectByExample(StucouExample example);

    int updateByExampleSelective(@Param("record") Stucou record, @Param("example") StucouExample example);

    int updateByExample(@Param("record") Stucou record, @Param("example") StucouExample example);
}