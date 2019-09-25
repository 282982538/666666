package com.shop.biz.impl;

import java.util.List;

import com.shop.bean.User;
import com.shop.biz.UserBiz;
import com.shop.dao.DBHelper;

public class UserBizImpl implements UserBiz {
	private DBHelper db = new DBHelper();
	


	/**
	 * 
	 */
	@Override
	public int reg(String uname, String pwd, String rname, String email) {
		String sql = "insert into users values(null,?,?,?,?,0,null)";
		return db.update(sql, uname, pwd, rname, email);
	}
	
	/**
	 * 
	 */
	@Override
	public User login(String uname, String pwd) {
		String sql = "select * from users where uname=? and pwd=?";
		List<User> users = db.find(sql, User.class, uname, pwd);
		if(users.size()>0) {
			return users.get(0);
		}
		return null;
	}
	
	
	//编辑地址
	@Override
	public int setaddress(String rname, String address, String email,int uid) {
		String sql = "update users set rname=?,address=?,email=? where uid=?";
		return db.update(sql, rname,address,email,uid);
	}
	
	
	//通过uid获取用户信息
	@Override
	public User getuser(int uid) {
		String sql = "select * from users where uid = ?";
		List<User> users = db.find(sql, User.class, uid);
		if(users.size()>0) {
			return users.get(0);
		}
		
		return null;
	}



}
