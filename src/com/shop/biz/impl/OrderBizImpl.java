package com.shop.biz.impl;

import java.util.List;
import java.util.Map;

import com.shop.bean.Order;
import com.shop.biz.OrderBiz;
import com.shop.dao.DBHelper;

public class OrderBizImpl implements OrderBiz{
	private DBHelper db = new DBHelper();
	@Override
	public Map<String,String> getorder() {
		String sql = "select MAX(oid) from orderinfo";
		return db.find(sql);
	}
	
	//获取未支付订单信息
	@Override
	public List<Order> getorder1() {
		String sql = "select * from orderinfo where cis=1";
		return db.find(sql, Order.class);
	}
	
	//添加订单商品信息
	@Override
	public int addOrdergoods(int oid, int gno, int uid, String size,int num) {
		String sql = "insert into ordergoodinfo values(null,?,?,?,?,?)";
		return db.update(sql, oid,gno,uid,size,num);
	}
	
	
	//得到订单里面商品信息
	@Override
	public List<Map<String, String>> getAllOrderGoods(int oid) {
		String sql = "select * from orderinfo o,ordergoodinfo og,goodsinfo g where o.oid=og.oid and og.gno=g.gno and og.oid=?";
		return db.finds(sql, oid);
	}
	
	
	//根据uid查询订单信息
	@Override
	public List<Order> getorderbyuid(int uid) {
		String sql = "select * from orderinfo where uid=? order by cis";
		return db.find(sql, Order.class, uid);
	}
	
	//付款
	@Override
	public int clearOrder(int oid) {
		String sql = "update orderinfo set cis=2 where oid=?";
		return db.update(sql, oid);
	}

	@Override
	public List<Map<String, String>> getgoods(int oid) {
		String sql = "select * from orderinfo o,ordergoodinfo og,goodsinfo g where o.oid=og.oid and og.gno=g.gno and o.oid=?";
		return db.finds(sql, oid);
	}
	
	
	//分页
	@Override
	public List<Order> getorderbypage(int page, int count,int uid) {
		String sql = "select * from orderinfo where uid=? order by cis limit "+(page-1)*count+","+count;
		return db.find(sql, Order.class,uid);
	}
	
}
