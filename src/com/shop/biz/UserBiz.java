package com.shop.biz;

import com.shop.bean.User;

public interface UserBiz {
	/**
	 * 
	 * @param uname		
	 * @param pwd		
	 * @param rname		
	 * @return
	 */
	public int reg(String uname,String pwd,String rname,String email);
	
	/**
	 * 
	 * @param uname
	 * @param pwd	
	 * @return
	 */
	public User login(String uname,String pwd);
	
	public int setaddress(String rname,String address,String email,int uid);
	
	public User getuser(int uid);
}
