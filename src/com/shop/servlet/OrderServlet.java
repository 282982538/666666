package com.shop.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.bean.Order;
import com.shop.biz.OrderBiz;
import com.shop.biz.impl.OrderBizImpl;

@WebServlet("/orderServlet")
public class OrderServlet extends HttpServlet {
	private OrderBiz ob = new OrderBizImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		PrintWriter out = resp.getWriter();
		String op = req.getParameter("op");
		
		if("addorderinfo".equals(op)) {
			addorderinfo(req,resp,out);
		}else if("getorderbyuid".equals(op)) {
			getorderbyuid(req,resp,out);
		}else if("clearorder".equals(op)) {
			clearorder(req,resp,out);
		}else if("getorder".equals(op)) {
			getorder(req,resp,out);
		}else if("changePage".equals(op)) {
			changePage(req,resp,out);
		}
	}
	
	//分页
	private void changePage(HttpServletRequest req, HttpServletResponse resp,
			PrintWriter out) {
		int page = Integer.parseInt(req.getParameter("page"));
		req.getSession().setAttribute("page", page);
		int uid = Integer.parseInt(req.getParameter("uid"));
		List<Order> list = ob.getorderbypage(page, 4,uid);
		
		
		req.getSession().setAttribute("order1", list);
		out.print(1);
	}

	//去订单详情页
	private void getorder(HttpServletRequest req, HttpServletResponse resp,
			PrintWriter out) {
		int oid = Integer.parseInt(req.getParameter("oid"));
		req.getSession().setAttribute("orderoid", oid);
		List<Map<String,String>> list = ob.getgoods(oid);
		double total = 0;
		for(Map<String,String> map : list){
			int s = Integer.parseInt(map.get("price")) * Integer.parseInt(map.get("num"));
			total+=s;
		}
		req.getSession().setAttribute("car", list);
		req.getSession().setAttribute("carsize", list.size());
		req.getSession().setAttribute("totalprice", total);
		
	}

	private void clearorder(HttpServletRequest req, HttpServletResponse resp,
			PrintWriter out) {
		int oid = Integer.parseInt(req.getParameter("oid"));
		
		int result = ob.clearOrder(oid);
		req.getSession().setAttribute("car", 0);
		req.getSession().setAttribute("carsize", 0);
		req.getSession().setAttribute("totalprice", 0);
		out.print(result);
	}
	
	
	//订单详情页
	private void getorderbyuid(HttpServletRequest req,
			HttpServletResponse resp, PrintWriter out) {
		int uid = Integer.parseInt(req.getParameter("uid"));
		
		List<Order> list = ob.getorderbyuid(uid);
		req.getSession().setAttribute("order1", list);
		
		req.getSession().setAttribute("page", 1);
		req.getSession().setAttribute("pages", 
				list.size()%4==0?list.size()/4:list.size()/4+1);
		List<Order> list1 = ob.getorderbyuid(uid);
		
		list = ob.getorderbypage(1, 4,uid);
		req.getSession().setAttribute("order1", list);
		out.print(1);
		
	}

	//添加订单商品信息
	private void addorderinfo(HttpServletRequest req, HttpServletResponse resp,
			PrintWriter out) {
		int oid = Integer.parseInt(req.getParameter("oid"));
		int gno = Integer.parseInt(req.getParameter("gno"));
		int uid = Integer.parseInt(req.getParameter("uid"));
		int num = Integer.parseInt(req.getParameter("num"));
		String size = req.getParameter("size");
		
		int result = ob.addOrdergoods(oid, gno, uid, size,num);
		
		//得到订单商品信息
		List<Map<String, String>> list = ob.getAllOrderGoods(oid);
		req.getSession().setAttribute("ordergoods", list);
		out.print(result);
	}
	
}
