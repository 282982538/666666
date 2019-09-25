package com.shop.biz;

import java.util.List;
import java.util.Map;

import com.shop.bean.Order;

public interface OrderBiz {
	public Map<String,String> getorder();
	
	public List<Order> getorder1();
	
	public int addOrdergoods(int oid,int gno,int uid,String size,int num);
	
	public List<Map<String,String>> getAllOrderGoods(int oid);
	
	public List<Order> getorderbyuid(int uid);
	
	public int clearOrder(int oid);
	
	public List<Map<String,String>> getgoods(int oid);
	
	public List<Order> getorderbypage(int page,int count,int uid);
}
