package com.ujiuye.dao;

import com.ujiuye.pojo.Cou;
import com.ujiuye.pojo.CouExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CouMapper {
    int countByExample(CouExample example);

    int deleteByExample(CouExample example);

    int deleteByPrimaryKey(Integer cid);

    int insert(Cou record);

    int insertSelective(Cou record);

    List<Cou> selectByExample(CouExample example);

    Cou selectByPrimaryKey(Integer cid);

    int updateByExampleSelective(@Param("record") Cou record, @Param("example") CouExample example);

    int updateByExample(@Param("record") Cou record, @Param("example") CouExample example);

    int updateByPrimaryKeySelective(Cou record);

    int updateByPrimaryKey(Cou record);
}