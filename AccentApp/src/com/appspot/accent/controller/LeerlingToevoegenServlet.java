package com.appspot.accent.controller;
import com.appspot.accent.dao.Dao;
import com.appspot.accent.model.*;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class LeerlingToevoegenServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String error;
		String succes;
		String username = request.getParameter("username").trim().toLowerCase();
		String password = request.getParameter("password").trim().toLowerCase();
		
		
		Administrator admin = (Administrator)(getServletContext().getAttribute( "admin" ));
		
			
			if(!username.equals("") && !password.equals("")){
				synchronized(this){
				Dao.INSTANCE.createLeerling(username, password);
				succes = "Leerling succesvol aangemaakt";
				request.setAttribute("lvmessage", succes);
			}
			}
			else{
				error = "Velden mogen niet leeg zijn!";
				request.setAttribute("lvmessage", error);
			}
		
		response.sendRedirect("LeerlingenBeheer.jsp");
	}
}
			
		
	


