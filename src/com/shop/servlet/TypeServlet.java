package com.shop.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.bean.Type;
import com.shop.biz.TypeBiz;
import com.shop.biz.impl.TypeBizImpl;


@WebServlet("/typeServlet")
public class TypeServlet extends HttpServlet {
	private TypeBiz tb = new TypeBizImpl();

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
		}
		
	}

	private void togoods(HttpServletRequest req, HttpServletResponse resp,
			PrintWriter out) {
		
	}
	
	
}
