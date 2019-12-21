package com.ujiuye.pojo;

import java.util.Date;

public class Logcs {
    private Integer logid;

    private Date day;

    private Integer sfk;

    private Integer cfk;

    private Integer status;


    private Stu stu;
    private Cou cou;
    public Stu getStu() {
        return stu;
    }
    public void setStu(Stu stu) {
        this.stu = stu;
    }
    public Cou getCou() {
        return cou;
    }
    public void setCou(Cou cou) {
        this.cou = cou;
    }



    public Integer getLogid() {
        return logid;
    }

    public void setLogid(Integer logid) {
        this.logid = logid;
    }

    public Date getDay() {
        return day;
    }

    public void setDay(Date day) {
        this.day = day;
    }

    public Integer getSfk() {
        return sfk;
    }

    public void setSfk(Integer sfk) {
        this.sfk = sfk;
    }

    public Integer getCfk() {
        return cfk;
    }

    public void setCfk(Integer cfk) {
        this.cfk = cfk;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}