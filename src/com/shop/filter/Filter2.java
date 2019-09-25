package com.shop.filter;

import java.io.IOException;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.bean.Type;
import com.shop.biz.TypeBiz;
import com.shop.biz.impl.TypeBizImpl;

@WebFilter("/index.jsp")
public class Filter2 implements Filter {

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request=(HttpServletRequest) req;
		HttpServletResponse response=(HttpServletResponse) resp;
		
		if(request.getSession().getAttribute("Mentypes") == null && request.getSession().getAttribute("Womentypes") == null){
			TypeBiz tb = new TypeBizImpl();
			List<Type> Mentypes = tb.getMenType();
			List<Type> Womentypes = tb.getWomenType();
			request.getSession().setAttribute("Mentypes", Mentypes);
			request.getSession().setAttribute("Womentypes", Womentypes);
		}
		chain.doFilter(request, response);

	}

}
