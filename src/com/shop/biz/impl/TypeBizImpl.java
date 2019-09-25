package com.shop.biz.impl;

import java.util.List;

import com.shop.bean.Type;
import com.shop.biz.TypeBiz;
import com.shop.dao.DBHelper;

public class TypeBizImpl implements TypeBiz {
	private DBHelper db = new DBHelper();
	@Override
	public List<Type> getMenType() {
		String sql = "select * from ttypeinfo where tno = 1 order by ttno";
		
		return db.find(sql, Type.class);
	}
	@Override
	public List<Type> getWomenType() {
		String sql = "select * from ttypeinfo where tno = 2 order by ttno";
		
		return db.find(sql, Type.class);
	}
	
	
}
