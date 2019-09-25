package com.shop.dao;

import java.io.BufferedInputStream;
import java.lang.reflect.Method;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;


public class DBHelper {
	static {
		try {
			Class.forName(ReadConfig.getInstance().getProperty("driverClass"));
		} catch (ClassNotFoundException e) {
			// 将错误信息写入到日志
			e.printStackTrace();
		}
	}
	
	/**
	 * 获取数据库连接的驱动
	 * @return
	 */
	public Connection getConnection() {
		Connection con = null;
		// 3.创建连接
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");
			DataSource ds = (DataSource)
			  envCtx.lookup("jdbc/shopping");

			con = ds.getConnection();

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (NamingException e) {
			e.printStackTrace();
		}
		return con;
	}
	
	/**
	 * 给预编译执行语句块中的占位符赋值
	 * @param pstmt 要赋值的预编译执行语句块对象
	 * @param params 要赋予的值
	 */
	private void setParams(PreparedStatement pstmt, Object ...params) {
		if (params == null || params.length <= 0) {	// 说明预编译执行语句中没有占位符
			return;
		}
		
		for (int i = 0, len = params.length; i < len; i++) {
			try {
				pstmt.setObject(i + 1, params[i]);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	/**
	 * 给预编译执行语句块中的占位符赋值
	 * @param pstmt 要赋值的预编译执行语句块对象
	 * @param params 要赋予的值
	 */
	private void setParams(PreparedStatement pstmt, List<Object> params) {
		if (params == null || params.size() <= 0) {	// 说明预编译执行语句中没有占位符
			return;
		}
		
		for (int i = 0, len = params.size(); i < len; i++) {
			try {
				pstmt.setObject(i + 1, params.get(i));
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	/**
	 * 关闭资源方法
	 * @param rs 要关闭的结果集
	 * @param pstmt 要关闭的预编译语句块
	 * @param con 要关闭的连接
	 */
	private void closeAll(ResultSet rs, PreparedStatement pstmt, Connection con) {
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (con != null) {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	/**
	 * 更新数据的方法
	 * @param sql 要指定的更新语句，insert、delete和update
	 * @param params 要指定的sql语句中对应占位符的值
	 * @return
	 */
	public int update(String sql, Object ...params) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int result = -1;
		try {
			con = this.getConnection();	// 获取连接
			pstmt = con.prepareStatement(sql);	//创建预编译执行语句块
			this.setParams(pstmt, params);	// 给预编译执行语句块中的占位符赋值
			result = pstmt.executeUpdate();	// 获取执行结果
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.closeAll(null, pstmt, con);
		}
		return result;
	}
	
	/**
	 * 获取结果集中的列的列名
	 * @param rs
	 * @return
	 */
	private String[] getColumnNames(ResultSet rs) {
		String[] columnNames = null;
		if (rs == null) {
			return null;
		}
		
		try {
			ResultSetMetaData rsmd;
			rsmd = rs.getMetaData();	// 获取结果集中的元数据
			int columnCount = rsmd.getColumnCount();	// 获取结果集中类的数量
			columnNames = new String[columnCount];
			
			// 循环获取列的名称
			for (int i = 0; i < columnCount; i++) {
				columnNames[i] = rsmd.getColumnName(i + 1).toLowerCase();	// 根据列的编号获取列的名称
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return columnNames;
	}
	
	/**
	 * 查询数据方法
	 * @param sql 要执行的查询语句
	 * @param params 要指定的sql语句中对应占位符的值
	 * @return 每一行数据以列名为键，对应列的值为值存到一个map中，将这些map即多行记录存到list中
	 */
	public List<Map<String, String>> finds(String sql, Object ...params) {
		List<Map<String, String>> list = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = this.getConnection();
			pstmt = con.prepareStatement(sql);
			this.setParams(pstmt, params);
			rs = pstmt.executeQuery();
			
			list = new ArrayList<Map<String,String>>();
			// 处理结果集 -> 将结果集中的数据循环读取出来存到一个List<Map<String, String>>中
			Map<String, String> map = null;
			String[] columnNames = this.getColumnNames(rs);
			while(rs.next()) {	// 每循环一次就是一行数据，每一行数据存到一个map
				map = new HashMap<String, String>();
				
				// 以列名为键，值为值，存到map中
				for (String columnName : columnNames) {
					map.put(columnName, rs.getString(columnName));
				}
				list.add(map);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.closeAll(rs, pstmt, con);
		}
		return list;
	}
	
	//
	public <T> List<T> find(String sql,Class<T> c,Object ...params){
		List<T> list = new ArrayList<T>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = this.getConnection();
			pstmt = con.prepareStatement(sql);
			this.setParams(pstmt, params);
			rs = pstmt.executeQuery();
			
			//处理结果集
			Method[] ms = c.getMethods();
			//通过结果集来得到我们这个表里面的所有字段
			String[] columnNames = this.getColumnNames(rs);
			
			//开始循环
			T t;    //泛型对象
			String mname;   //方法名
			String cname;   //列名
			String ctn;     //类型名
			
			while( rs.next() ){
				//首先 通过反射  来得到对象
				t = (T)c.newInstance();
				//循环列名
				for(int i = 0;i < columnNames.length; i++){
					cname = columnNames[i];
					//将这些列名 转换为方法名
					cname = "set" + cname.substring(0,1).toUpperCase() + cname.substring(1).toLowerCase();
					//开始和方法名进行对比
					for( Method m : ms ){
						mname = m.getName();
						if( cname.equals(mname) && rs.getObject(columnNames[i]) != null){
							ctn = rs.getObject(columnNames[i]).getClass().getName();
							if( "java.lang.Integer".equals(ctn)){
								m.invoke(t, rs.getInt(columnNames[i]));
							}else if( "java.lang.String".equals(ctn)){
								m.invoke(t, rs.getString(columnNames[i]));
							}else if("java.lang.Double".equals(ctn)){
								m.invoke(t, rs.getDouble(columnNames[i]));
							}else if("oracle.sql.BLOB".equals(ctn)){
								byte[] bytes = null;
								Blob blob = rs.getBlob(columnNames[i]);
								BufferedInputStream bis = new BufferedInputStream( blob.getBinaryStream());
								bytes = new byte[(int) blob.length() ];
								bis.read(bytes);
								m.invoke(t, bytes);
							}else{
								m.invoke(t, rs.getString(columnNames[i]));
							}
						}
					}
				}
				list.add(t);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			this.closeAll(rs, pstmt, con);
		}
		return list;
	}
	
	/**
	 * 查询数据方法
	 * @param sql 要执行的查询语句
	 * @param params 要指定的sql语句中对应占位符的值
	 * @return 每一行数据以列名为键，对应列的值为值存到一个map中，将这些map即多行记录存到list中
	 */
	public List<Map<String, String>> finds(String sql, List<Object> params) {
		List<Map<String, String>> list = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = this.getConnection();
			pstmt = con.prepareStatement(sql);
			this.setParams(pstmt, params);
			rs = pstmt.executeQuery();
			
			list = new ArrayList<Map<String,String>>();
			// 处理结果集 -> 将结果集中的数据循环读取出来存到一个List<Map<String, String>>中
			Map<String, String> map = null;
			String[] columnNames = this.getColumnNames(rs);
			while(rs.next()) {	// 每循环一次就是一行数据，每一行数据存到一个map
				map = new HashMap<String, String>();
				
				// 以列名为键，值为值，存到map中
				for (String columnName : columnNames) {
					map.put(columnName, rs.getString(columnName));
				}
				list.add(map);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.closeAll(rs, pstmt, con);
		}
		return list;
	}
	
	/**
	 * 查询数据方法
	 * @param sql 要执行的查询语句
	 * @param params 要指定的sql语句中对应占位符的值
	 * @return 每一行数据以列名为键，对应列的值为值存到一个map中，将这些map即多行记录存到list中
	 */
	public List<Map<String, Object>> gets(String sql, Object ...params) {
		List<Map<String, Object>> list = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = this.getConnection();
			pstmt = con.prepareStatement(sql);
			this.setParams(pstmt, params);
			rs = pstmt.executeQuery();
			
			list = new ArrayList<Map<String,Object>>();
			// 处理结果集 -> 将结果集中的数据循环读取出来存到一个List<Map<String, String>>中
			Map<String, Object> map = null;
			String[] columnNames = this.getColumnNames(rs);
			while(rs.next()) {	// 每循环一次就是一行数据，每一行数据存到一个map
				map = new HashMap<String, Object>();
				Object obj = null;
				String typeName = null;
				Blob blob = null;
				// 以列名为键，值为值，存到map中
				byte[] bt = null;
				for (String columnName : columnNames) {
					obj = rs.getObject(columnName);
					if (obj != null) {
						typeName = obj.getClass().getSimpleName();
						if ("BLOB".equals(typeName)) {
							blob = rs.getBlob(columnName);
							// 转成字节数组
							bt = blob.getBytes(1, (int)blob.length());
							map.put(columnName, bt);
						} else {
							map.put(columnName, obj);
						}
					}
				}
				list.add(map);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.closeAll(rs, pstmt, con);
		}
		return list;
	}
	
	/**
	 * 查询数据方法
	 * @param sql 要执行的查询语句
	 * @param params 要指定的sql语句中对应占位符的值
	 * @return 每一行数据以列名为键，对应列的值为值存到一个map中，将这些map即多行记录存到list中
	 */
	public List<Map<String, Object>> gets(String sql, List<Object> params) {
		List<Map<String, Object>> list = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = this.getConnection();
			pstmt = con.prepareStatement(sql);
			this.setParams(pstmt, params);
			rs = pstmt.executeQuery();
			
			list = new ArrayList<Map<String,Object>>();
			// 处理结果集 -> 将结果集中的数据循环读取出来存到一个List<Map<String, String>>中
			Map<String, Object> map = null;
			
			String[] columnNames = this.getColumnNames(rs);
			while(rs.next()) {	// 每循环一次就是一行数据，每一行数据存到一个map
				map = new HashMap<String, Object>();
				Object obj = null;
				String typeName = null;
				Blob blob = null;
				// 以列名为键，值为值，存到map中
				byte[] bt = null;
				for (String columnName : columnNames) {
					obj = rs.getObject(columnName);
					if (obj != null) {
						typeName = obj.getClass().getSimpleName();
						if ("BLOB".equals(typeName)) {
							blob = rs.getBlob(columnName);
							// 转成字节数组
							bt = blob.getBytes(1, (int)blob.length());
							map.put(columnName, bt);
						} else {
							map.put(columnName, obj);
						}
					}
				}
				list.add(map);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.closeAll(rs, pstmt, con);
		}
		return list;
	}
	
	/**
	 * 查询单行数据方法
	 * @param sql 要执行的查询语句
	 * @param params 要指定的sql语句中对应占位符的值
	 * @return 每一行数据以列名为键，对应列的值为值存到一个map中，将这些map即多行记录存到list中
	 */
	public Map<String, String> find(String sql, Object ...params) {
		Map<String, String> map = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = this.getConnection();
			pstmt = con.prepareStatement(sql);
			this.setParams(pstmt, params);
			rs = pstmt.executeQuery();
			
			// 处理结果及 -> 将结果集中的数据循环读取出来存到一个List<Map<String, String>>中
			String[] columnNames = this.getColumnNames(rs);
			while(rs.next()) {	// 每循环一次就是一行数据，每一行数据存到一个map
				map = new HashMap<String, String>();
				
				// 以列名为键，值为值，存到map中
				for (String columnName : columnNames) {
					map.put(columnName, rs.getString(columnName));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.closeAll(rs, pstmt, con);
		}
		return map;
	}
	
	/**
	 * 获取总记录数的方法
	 * @param sql
	 * @param params
	 * @return
	 */
	public int getTotal(String sql, Object ... params){
		int total = -1;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = this.getConnection();
			pstmt = con.prepareStatement(sql);
			this.setParams(pstmt, params);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				total = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.closeAll(rs, pstmt, con);
		}
		return total;
	}
	/*
	 * 查询总数
	 */
	public float getOne (String sql, Object ... params) {
		float sum = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = this.getConnection();
			pstmt = con.prepareStatement(sql);
			this.setParams(pstmt, params);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				sum = rs.getFloat(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.closeAll(rs, pstmt, con);
		}
		return sum;
	}
//	public static void main(String[] args) {
//		DBHelper db = new DBHelper();
//		int total = db.getTotal("select count(*) from emp where deptno = ?", 20);
//		System.out.println(total);
//	}

}
