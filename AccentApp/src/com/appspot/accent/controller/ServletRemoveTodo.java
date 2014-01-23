package com.appspot.accent.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.appspot.accent.dao.Dao;



public class ServletRemoveTodo extends HttpServlet {
  private static final long serialVersionUID = 1L;
  
  public void doPost(HttpServletRequest req, HttpServletResponse resp)throws IOException, ServletException {
	  
	  boolean cbState = req.getParameter("boxid") != null;
	  String id = req.getParameter("id");
	  
	  if(cbState){
		 Dao.INSTANCE.finishTodo(Long.parseLong(id), true);
		 req.getRequestDispatcher("TodoApplication.jsp").forward(req, resp);
	  }
	  else{Dao.INSTANCE.finishTodo(Long.parseLong(id), false);
	resp.sendRedirect("/TodoApplication.jsp");
	  }
	  
	  
    //resp.sendRedirect("/TodoApplication.jsp");
  }
} 