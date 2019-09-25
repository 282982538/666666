package com.shop.biz;

import java.util.List;
import java.util.Map;

import com.shop.bean.Goods;

public interface GoodsBiz {

	/**
	 * 根据分类得到所有的商品
	 * @param ttname
	 * @return
	 */
	public List<Goods> getGoods(String ttname);
	
	public List<Map<String,String>> getSizes(String ttname);
	
	public List<Goods> getAllGoods();
	
	public List<Goods> getSexGoods(String tname);

	/**
	 * 得到单个商品信息
	 * @param ttname
	 * @return
	 */
	public Goods getsingleGood(String gname);
	
	public List<Goods> getAllGoodsbypage(int page,int count);
	
	public List<Map<String,String>> getGoodsbypage(int page,int count,String ttname);
	
	public List<Map<String,String>> getSexGoodsbypage(int page,int count,String tname);
	
	public List<Map<String,String>> getAllSizes();
	
}
