package com.appspot.accent.controller;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

public class IndexFilter implements Filter {
	public void init(FilterConfig arg0) throws ServletException {
	}
	
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException {	
		HttpServletRequest session = (HttpServletRequest) req;
		
		Object o = session.getSession().getAttribute("LoggedUser");
		String user = (String)o;
		
		if (user == null) {
			req.setAttribute("message", "U dient eerst in te loggen!");
			session.getRequestDispatcher("Inloggen.jsp").forward(req, resp);
			return;
		} else {
			chain.doFilter(req, resp);
		}
	}
	
	public void destroy() {
	}
}
