package com.topscit.springboot1.bean;

import java.util.Date;
import java.util.List;

public class Yorder {
    private String yoid;

    private String ymoney;

    private Date ytime;

    private String ystate;

    private String cid;
    
    private List<OrderGoods> orderGoods;

    public List<OrderGoods> getOrderGoods() {
		return orderGoods;
	}

	public void setOrderGoods(List<OrderGoods> orderGoods) {
		this.orderGoods = orderGoods;
	}

	public String getYoid() {
        return yoid;
    }

    public void setYoid(String yoid) {
        this.yoid = yoid == null ? null : yoid.trim();
    }

    public String getYmoney() {
        return ymoney;
    }

    public void setYmoney(String ymoney) {
        this.ymoney = ymoney == null ? null : ymoney.trim();
    }

    public Date getYtime() {
        return ytime;
    }

    public void setYtime(Date ytime) {
        this.ytime = ytime;
    }

    public String getYstate() {
        return ystate;
    }

    public void setYstate(String ystate) {
        this.ystate = ystate == null ? null : ystate.trim();
    }

    public String getCid() {
        return cid;
    }

    public void setCid(String cid) {
        this.cid = cid == null ? null : cid.trim();
    }

	@Override
	public String toString() {
		return "Yorder [yoid=" + yoid + ", ymoney=" + ymoney + ", ytime=" + ytime + ", ystate=" + ystate + ", cid="
				+ cid + "]";
	}
}