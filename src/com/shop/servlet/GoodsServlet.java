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

import com.shop.bean.Goods;
import com.shop.bean.Type;
import com.shop.biz.GoodsBiz;
import com.shop.biz.impl.GoodsBizImpl;

@WebServlet("/goodsServlet")
public class GoodsServlet extends HttpServlet {
	private GoodsBiz gb = new GoodsBizImpl();
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
		
		if("togoods".equals(op)) {
			togoods(req,resp,out);
		}else if("getgoods".equals(op)) {
			getgoods(req,resp,out);
		}else if("getAllGoods".equals(op)) {
			getAllGoods(req,resp,out);
		}else if("getSexGoods".equals(op)) {
			getSexGoods(req,resp,out);
		}else if("changePage".equals(op)) {
			changePage(req,resp,out);
		}
		
	}

	
	private void changePage(HttpServletRequest req, HttpServletResponse resp,
			PrintWriter out) {
		int page = Integer.parseInt(req.getParameter("page"));
		req.getSession().setAttribute("page", page);
		List<Goods> goods = gb.getAllGoodsbypage(page, 7);
		req.getSession().setAttribute("goods", goods);
		out.print(1);
	}

	private void getSexGoods(HttpServletRequest req, HttpServletResponse resp,
			PrintWriter out) {
		String tname = req.getParameter("tname");
		List<Goods> goods = gb.getSexGoods(tname);
		req.getSession().setAttribute("goods", goods);
		req.getSession().setAttribute("page", 1);
		req.getSession().setAttribute("pages", 
				goods.size()%7==0?goods.size()/7:goods.size()/7+1);
		List<Map<String, String>> list = gb.getSexGoodsbypage(1, 7, tname);
		req.getSession().setAttribute("goods", list);
		out.print(1);
		
	}

	private void getAllGoods(HttpServletRequest req, HttpServletResponse resp,
			PrintWriter out) {
		List<Goods> goods = gb.getAllGoods();
		
		req.getSession().setAttribute("goods", goods);
		
		req.getSession().setAttribute("page", 1);
		req.getSession().setAttribute("pages", 
				goods.size()%7==0?goods.size()/7:goods.size()/7+1);
		List<Goods> list = gb.getAllGoodsbypage(1, 7);
		req.getSession().setAttribute("goods", list);
		List<Map<String, String>> list1 = gb.getAllSizes();
		req.getSession().setAttribute("sizes", list1);
		
		out.print(1);
	}

	private void getgoods(HttpServletRequest req, HttpServletResponse resp,
			PrintWriter out) {
		String gname = req.getParameter("gname");
		Goods goods = gb.getsingleGood(gname);
		req.getSession().setAttribute("singlegood", goods);
		out.print(1);
	}

	private void togoods(HttpServletRequest req, HttpServletResponse resp,
			PrintWriter out) {
		String ttname = req.getParameter("ttname");
		List<Goods> goods = gb.getGoods(ttname);
		List<Map<String, String>> list = gb.getSizes(ttname);
		
		req.getSession().setAttribute("page", 1);
		req.getSession().setAttribute("pages", 
				goods.size()%7==0?goods.size()/7:goods.size()/7+1);
		req.getSession().setAttribute("goods", goods);
		req.getSession().setAttribute("sizes", list);
		out.print(1);
	}
	
}
