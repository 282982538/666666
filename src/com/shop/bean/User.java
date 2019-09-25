package com.shop.bean;

/**
 * �û�ʵ����
 * @author 11585
 *
 */
public class User {
	private int uid;
	private String uname;
	private String pwd;
	private String rname;
	private String email;
	private int isadmin;
	private String address;
	
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getRname() {
		return rname;
	}
	public void setRname(String rname) {
		this.rname = rname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getIsadmin() {
		return isadmin;
	}
	public void setIsadmin(int isadmin) {
		this.isadmin = isadmin;
	}
	
	public User(int uid, String uname, String pwd, String rname, String email, int isadmin) {
		super();
		this.uid = uid;
		this.uname = uname;
		this.pwd = pwd;
		this.rname = rname;
		this.email = email;
		this.isadmin = isadmin;
	}
	public User() {
		super();
	}
	
	
	
}
