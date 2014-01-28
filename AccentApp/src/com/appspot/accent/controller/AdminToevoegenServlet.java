package com.appspot.accent.controller;
import com.appspot.accent.dao.Dao;
import com.appspot.accent.model.*;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class AdminToevoegenServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String error;
		String succes;
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		
		if(!username.equalsIgnoreCase("") && !password.equalsIgnoreCase("")){
			Dao.INSTANCE.createAdministrator(username, password);
			succes = "Administrator aangemaakt!";
			request.setAttribute("message",succes);
		}
		
		else{error = "Velden mogen niet leeg zijn!"; request.setAttribute("message", error);}
		
		request.getRequestDispatcher("AdminBeheer.jsp").forward(request, response);
		
		
	}
}
		
	


