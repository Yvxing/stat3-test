package com.ujiuye.pojo;

public class Cou {
    private Integer cid;

    private String cname;

    private String dur;

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname == null ? null : cname.trim();
    }

    public String getDur() {
        return dur;
    }

    public void setDur(String dur) {
        this.dur = dur == null ? null : dur.trim();
    }
}