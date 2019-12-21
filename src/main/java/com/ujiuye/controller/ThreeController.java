package com.ujiuye.controller;

import com.github.pagehelper.PageInfo;
import com.ujiuye.pojo.Logcs;
import com.ujiuye.pojo.Stu;
import com.ujiuye.service.ThreeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/three")
public class ThreeController {

    @Autowired
    private ThreeService threeService;


    /**
     * 展示所有学生,查询，分页
     * @param currentpage
     * @param keyCode
     * @return
     */
    @RequestMapping("/showInfo")
    @ResponseBody
    public PageInfo<Stu> showinfo(int currentpage, String keyCode){
        return threeService.showStu(currentpage,keyCode);
    }

    /**
     * 添加课程
     * @param stu
     * @param sintime
     * @param souttime
     * @return
     */
    @RequestMapping("/addStu")
    public String addStu(Stu stu,String sintime,String souttime){
            threeService.addStu(stu,sintime,souttime);
        return "redirect:/index.jsp";
    }

    /**
     * 展示学生所选的课程
     * @param sid
     * @return
     */
    @RequestMapping("/getOneInfo")
    @ResponseBody
    public Stu getOneInfo(int sid){
        return threeService.getCourse(sid);
    }

    /**
     * 修改学生毕业状态
     * @param ids
     * @param resp
     */
    @RequestMapping("/bachDelete")
    public void bachDelete(String ids, HttpServletResponse resp){
        threeService.bachDelete(ids);

        try {
            resp.getWriter().print(true);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 移除学生的课程
     * @param cid
     * @return
     */
    @RequestMapping("/csDel")
    public String csDel(String cid){        //cid+sid
        threeService.csDel(cid);
        return "redirect:/index.jsp";
    }

    /**
     * 添加课程
     * @param sid
     * @param cids
     * @return
     */
    @RequestMapping("/addCou")
    public String addCou(int sid,String cids){
        threeService.addCou(sid,cids);

        return "redirect:/index.jsp";
    }

    /**
     * 其中一名学生某一天某一天堂课的记录
     * @param cid
     * @return
     */
    @RequestMapping("/getOnelog")
    @ResponseBody
    public List<Logcs> getOnelog(String cid){       //cid+sid
        return threeService.onelogs(cid);
    }

}
