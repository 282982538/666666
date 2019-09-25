package com.shop.bean;

public class Car {
	private int cno;
	private int uid;
	private int gno;
	private int num;
	private int price;
	
	
	
	
	public int getCno() {
		return cno;
	}




	public void setCno(int cno) {
		this.cno = cno;
	}




	public int getUid() {
		return uid;
	}




	public void setUid(int uid) {
		this.uid = uid;
	}




	public int getGno() {
		return gno;
	}




	public void setGno(int gno) {
		this.gno = gno;
	}




	public int getNum() {
		return num;
	}




	public void setNum(int num) {
		this.num = num;
	}




	public int getPrice() {
		return price;
	}




	public void setPrice(int price) {
		this.price = price;
	}




	




	public Car(int cno, int uid, int gno, int num, int price) {
		super();
		this.cno = cno;
		this.uid = uid;
		this.gno = gno;
		this.num = num;
		this.price = price;
	}



	public Car() {
		super();
	}
	
	
	
	
}
