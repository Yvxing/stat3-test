package com.ujiuye.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ujiuye.dao.CouMapper;
import com.ujiuye.dao.LogcsMapper;
import com.ujiuye.dao.StuMapper;
import com.ujiuye.dao.StucouMapper;
import com.ujiuye.pojo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class ThreeServiceImpl implements ThreeService {

    @Autowired
    private StuMapper stuMapper;
    @Autowired
    private CouMapper couMapper;
    @Autowired
    private StucouMapper stucouMapper;
    @Autowired
    private LogcsMapper logcsMapper;


    /**
     * 显示所有的学生
     * @return
     */
    public PageInfo<Stu> showStu(int currentpage,String keyCode) {

        StuExample stuExample = new StuExample();
        PageHelper.startPage(currentpage,5);

        if (keyCode!="%%"){
            stuExample.createCriteria().andSnameLike(keyCode);

            List<Stu> stus = stuMapper.selectByExample(stuExample);
            PageInfo<Stu> info = new PageInfo<Stu>(stus);

            if (info.getPrePage()<1){
                info.setPrePage(1);
            }
            if (info.getNextPage()==0){
                info.setNextPage(info.getPages());
            }
            return info;

        }
        List<Stu> stus = stuMapper.selectByExample(null);
        PageInfo<Stu> info = new PageInfo<Stu>(stus);

        if (info.getPrePage()<1){
            info.setPrePage(1);
        }
        if (info.getNextPage()==0){
            info.setNextPage(info.getPages());
        }

        return info;
    }

    /**
     * 添加学生
     * @param stu
     * @param sintime
     * @param souttime
     */
    public void addStu(Stu stu,String sintime,String souttime){
        DateFormat df = new SimpleDateFormat("y-M-d");
        try {
            Date parse = df.parse(sintime);
            Date parse1 = df.parse(souttime);
            stu.setOuttime(parse1);
            stu.setIntime(parse);
            stu.setOrin(0);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        stuMapper.insertSelective(stu);
    }

    /**
     * 显示对应学生选取的课程
     * @param sid
     * @return
     */
    public Stu getCourse(int sid) {
        Stu stu = stuMapper.selectByPrimaryKey(sid);
        List<Cou> cous = new ArrayList<Cou>();

        StucouExample stucouExample = new StucouExample();
        stucouExample.createCriteria().andSidEqualTo(sid);
        List<Stucou> stucous = stucouMapper.selectByExample(stucouExample);

        for (Stucou sc: stucous) {
            Cou cou = couMapper.selectByPrimaryKey(sc.getCid());
            cous.add(cou);
        }
        stu.setCous(cous);

        return stu;
    }

    /**
     * 批量删除
     * @param ids
     */
    public void bachDelete(String ids) {
        String[] split = ids.split(",");
        for (String s: split) {
            Stu stu = stuMapper.selectByPrimaryKey(Integer.parseInt(s));
            stu.setOrin(1);
            stuMapper.updateByPrimaryKey(stu);
        }
    }

    /**
     * 删除学生和课程的关联
     * @param cidsid
     */
    public void csDel(String cidsid) {
        String[] split = cidsid.split(",");
        String cid = split[0];
        String sid = split[1];

        StucouExample stucouExample = new StucouExample();
        StucouExample.Criteria criteria = stucouExample.createCriteria();
        criteria.andCidEqualTo(Integer.parseInt(cid));
        criteria.andSidEqualTo(Integer.parseInt(sid));

        stucouMapper.deleteByExample(stucouExample);
    }

    /**
     * 中间表的添加
     * @param sid
     * @param cids
     */
    public void addCou(int sid, String cids) {
        String[] split = cids.split(",");
        for (String s: split) {
            Stucou stucou = new Stucou();
            stucou.setSid(sid);
            stucou.setCid(Integer.parseInt(s));

            stucouMapper.insert(stucou);
        }

    }

    /**
     * 其中一名学生某一天某一天堂课的记录
     * @param cidsid
     * @return
     */
    public List<Logcs> onelogs(String cidsid) {
        String[] split = cidsid.split(",");
        String cid = split[0];
        String sid = split[1];
        int cidInt = Integer.parseInt(cid);
        int sidInt = Integer.parseInt(sid);

        LogcsExample logcsExample = new LogcsExample();
        LogcsExample.Criteria criteria = logcsExample.createCriteria();
        criteria.andSfkEqualTo(sidInt);
        criteria.andCfkEqualTo(cidInt);

        List<Logcs> logcs = logcsMapper.selectByExample(logcsExample);
        for (Logcs lcs: logcs) {
            Stu stu = stuMapper.selectByPrimaryKey(sidInt);
            lcs.setStu(stu);
            Cou cou = couMapper.selectByPrimaryKey(cidInt);
            lcs.setCou(cou);
        }

        return logcs;
    }
}
