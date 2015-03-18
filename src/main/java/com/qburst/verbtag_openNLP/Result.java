package com.qburst.verbtag_openNLP;

public class Result {

    String vlist;
    String rlist;
    public Result(String vlist, String rlist) {

        this.vlist = vlist;
        this.rlist = rlist;
    }

    public String getVlist() {
        return vlist;
    }

    public void setVlist(String vlist) {
        this.vlist = vlist;
    }

    public String getRlist() {
        return rlist;
    }

    public void setRlist(String rlist) {
        this.rlist = rlist;
    }

}
