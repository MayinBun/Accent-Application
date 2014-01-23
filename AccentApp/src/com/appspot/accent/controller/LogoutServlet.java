package com.appspot.accent.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LogoutServlet extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		}
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		resp.setHeader("Cache-Control", "no-cache, no-store");
		resp.setHeader("Pragma", "no-cache");
		
		req.getSession().removeAttribute( "userobject" );
		req.getSession().removeAttribute( "LoggedUser" );
		req.getSession().invalidate();
		resp.sendRedirect("Inloggen.jsp");
		
	}
}






