package com.ujiuye.pojo;

import java.util.Date;
import java.util.List;

public class Stu {
    private Integer sid;

    private String sname;

    private Date intime;

    private Date outtime;

    private Integer orin;


    private List<Cou> cous;
    public List<Cou> getCous() {
        return cous;
    }
    public void setCous(List<Cou> cous) {
        this.cous = cous;
    }


    public Integer getSid() {
        return sid;
    }

    public void setSid(Integer sid) {
        this.sid = sid;
    }

    public String getSname() {
        return sname;
    }

    public void setSname(String sname) {
        this.sname = sname == null ? null : sname.trim();
    }

    public Date getIntime() {
        return intime;
    }

    public void setIntime(Date intime) {
        this.intime = intime;
    }

    public Date getOuttime() {
        return outtime;
    }

    public void setOuttime(Date outtime) {
        this.outtime = outtime;
    }

    public Integer getOrin() {
        return orin;
    }

    public void setOrin(Integer orin) {
        this.orin = orin;
    }
}