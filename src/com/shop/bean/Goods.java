package com.shop.bean;

public class Goods {

	private int gno;
	private String gname;
	private int tno;
	private int ttno;
	private int price;
	private String desc;
	private String pics;
	private int sno;
	
	public int getSno() {
		return sno;
	}
	public void setSno(int sno) {
		this.sno = sno;
	}
	public int getGno() {
		return gno;
	}
	public void setGno(int gno) {
		this.gno = gno;
	}
	public String getGname() {
		return gname;
	}
	public void setGname(String gname) {
		this.gname = gname;
	}
	public int getTno() {
		return tno;
	}
	public void setTno(int tno) {
		this.tno = tno;
	}
	public int getTtno() {
		return ttno;
	}
	public void setTtno(int ttno) {
		this.ttno = ttno;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	public String getPics() {
		return pics;
	}
	public void setPics(String pics) {
		this.pics = pics;
	}
	public Goods(int gno, String gname, int tno, int ttno, int price, String desc, String pics) {
		super();
		this.gno = gno;
		this.gname = gname;
		this.tno = tno;
		this.ttno = ttno;
		this.price = price;
		this.desc = desc;
		this.pics = pics;
	}
	public Goods() {
		super();
	}
	
	
	
}
