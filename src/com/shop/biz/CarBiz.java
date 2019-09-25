package com.shop.biz;

import java.util.List;
import java.util.Map;

import com.shop.bean.Car;
import com.shop.bean.Goods;


public interface CarBiz {
	/**
	 * 根据用户id得到购物车内容
	 * @param uid
	 * @return
	 */
	public List<Map<String,String>> getCar(String uname);
	
	/**
	 * 添加购物车
	 * @param uid
	 * @param gno
	 * @param num
	 * @return
	 */
	public int setCar(int uid,int gno,int num,String size);
	
	
	
	public int checkCar(int count,int uid,int gno,String size);
	
	public int deleteCar(int cno);
	
	
	
	public int addOrder(int uid,String time);
	
	public int clearCar(int uid);
	
	

	
	
}
