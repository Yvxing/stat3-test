package com.ujiuye.dao;

import com.ujiuye.pojo.Logcs;
import com.ujiuye.pojo.LogcsExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface LogcsMapper {
    int countByExample(LogcsExample example);

    int deleteByExample(LogcsExample example);

    int deleteByPrimaryKey(Integer logid);

    int insert(Logcs record);

    int insertSelective(Logcs record);

    List<Logcs> selectByExample(LogcsExample example);

    Logcs selectByPrimaryKey(Integer logid);

    int updateByExampleSelective(@Param("record") Logcs record, @Param("example") LogcsExample example);

    int updateByExample(@Param("record") Logcs record, @Param("example") LogcsExample example);

    int updateByPrimaryKeySelective(Logcs record);

    int updateByPrimaryKey(Logcs record);
}