package com.ujiuye.service;

import com.github.pagehelper.PageInfo;
import com.ujiuye.pojo.Logcs;
import com.ujiuye.pojo.Stu;

import java.text.ParseException;
import java.util.List;

public interface ThreeService {

    PageInfo<Stu> showStu(int currentpage, String keyCode);

    void addStu(Stu stu,String sintime,String souttime);

    Stu getCourse(int sid);

    void bachDelete(String ids);

    void  csDel(String cidsid);

    void addCou(int sid,String cids);

    List<Logcs> onelogs (String cidsid);
}
