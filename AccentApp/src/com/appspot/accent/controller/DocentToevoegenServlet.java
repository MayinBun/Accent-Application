package com.appspot.accent.controller;
import com.appspot.accent.dao.Dao;
import com.appspot.accent.model.*;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class DocentToevoegenServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String error;
		String succes;
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		
		if(!username.equals("")&&!password.equals("")){
			
				Dao.INSTANCE.createDocent(username, password);
				succes = "Docent succesvol toegevoegd!";
				request.setAttribute("message", succes);
			
		}
		else{error = "Velden mogen niet leeg zijn"; request.setAttribute("message", error);}
		
		response.setHeader("Refresh", "0.2; URL=DocentenBeheer.jsp");
		//request.getRequestDispatcher("DocentenBeheer.jsp").forward(request, response);
	}
}
			
		
	


