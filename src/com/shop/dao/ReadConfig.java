package com.shop.dao;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;


public class ReadConfig extends Properties{
	private static final long serialVersionUID = -7380130243688045114L;
	private static ReadConfig instance = new ReadConfig();
	/*
	 * 读取文件
	 */
	private ReadConfig() {
		InputStream is = null;
		try {
			is = ReadConfig.class.getClassLoader().getResourceAsStream("db.properties");
			this.load(is);
		} catch (IOException e) {
			e.printStackTrace();
		}finally {
			if(is !=null){
				try {
					is.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}
	public static  ReadConfig getInstance(){
		return instance;
	}

}
