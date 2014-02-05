package com.appspot.accent.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.appspot.accent.dao.Dao;




public class DocentVerwijderenServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	protected synchronized void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		synchronized(this){
		String id = request.getParameter("id");
		Dao.INSTANCE.removeDocent(Long.parseLong(id));
		request.getRequestDispatcher("DocentenBeheer.jsp").forward(request, response);
		}
	}
}

		
		
	
		
		
		
	


