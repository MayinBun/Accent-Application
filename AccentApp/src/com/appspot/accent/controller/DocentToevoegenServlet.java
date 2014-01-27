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
		
		List<User> docenten = Dao.INSTANCE.getAlleDocenten();
		Administrator admin = (Administrator)(getServletContext().getAttribute( "admin" ));
		
		if(admin.zoekDocent(username) == true){
		error = "Er bestaat al een docent met hetzelfde gebruiksnaam";
		request.setAttribute("message",error);
		}
		
		else{
			
				User newUser = new Leerling(username,password);
				admin.createUser(newUser);
				succes = "Docent succesvol toegevoegd!";
				request.setAttribute("message", succes);
			}		
		
		request.getRequestDispatcher("Docenttoevoegen.jsp").forward(request, response);
	}
}
			
		
	


