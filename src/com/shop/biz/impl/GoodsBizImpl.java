package com.shop.biz.impl;

import java.util.List;
import java.util.Map;

import com.shop.bean.Goods;
import com.shop.bean.Type;
import com.shop.biz.GoodsBiz;
import com.shop.dao.DBHelper;

public class GoodsBizImpl implements GoodsBiz{
	private DBHelper db = new DBHelper();
	
	public List<Goods> getGoods(String ttname) {
		//System.out.println(ttname);
		String sql = "select * from goodsinfo g join ttypeinfo t on g.ttno=t.ttno where ttname=?";
		return db.find(sql, Goods.class, ttname);
	}

	@Override
	public Goods getsingleGood(String gname) {
		String sql = "select * from goodsinfo where gname=?";
		List<Goods> goods = db.find(sql, Goods.class, gname);
		if(goods.size()>0){
			return goods.get(0);
		}
		return null;
	}

	@Override
	public List<Goods> getAllGoods() {
		String sql = "select * from goodsinfo";
		return db.find(sql, Goods.class);
	}

	@Override
	public List<Goods> getSexGoods(String tname) {
		String sql = "select * from typeinfo t,ttypeinfo tt,goodsinfo g where g.ttno=tt.ttno and tt.tno=t.tno and tname=?";
		return db.find(sql, Goods.class, tname);
	}

	@Override
	public List<Map<String, String>> getSizes(String ttname) {
		String sql = "select * from goodsinfo g,sizeinfo s,ttypeinfo t where g.ttno=s.ttno and g.ttno=t.ttno and ttname=? group by size";
		return db.finds(sql, ttname);
	}
	
	
	//全部商品分页
	@Override
	public List<Goods> getAllGoodsbypage(int page, int count) {
		String sql = "select * from goodsinfo limit "+(page-1)*count+","+count;
		return db.find(sql, Goods.class);
	}
	
	
	//按种类分页
	@Override
	public List<Map<String, String>> getGoodsbypage(int page, int count,
			String ttname) {
		String sql = "select * from goodsinfo g,ttypeinfo t where g.ttno=t.ttno and t.ttname="+ttname
				+" limit "+(page-1)*count+","+count;
		return db.finds(sql);
	}

	@Override
	public List<Map<String, String>> getSexGoodsbypage(int page, int count,
			String tname) {
		String sql = "select * from goodsinfo g,ttypeinfo tt,typeinfo t where g.ttno=tt.ttno and"
				+ " tt.tno=t.tno and t.tname=? limit "+(page-1)*count+","+count;
		return db.finds(sql,tname);
	}

	@Override
	public List<Map<String, String>> getAllSizes() {
		String sql = "select * from goodsinfo g,sizeinfo s where g.ttno=s.ttno group by size";
		return db.finds(sql);
	}
	
	
	
}
