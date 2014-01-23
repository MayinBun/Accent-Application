package com.appspot.accent.controller;
import com.appspot.accent.model.*;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class StagebegeleidertoevoegenServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String error;
		String succes;
		String username = request.getParameter("username");
		String password = request.getParameter("password");
	
		
		Administrator admin = (Administrator)(getServletContext().getAttribute( "admin" ));
		
		if(admin.zoekBegeleider(username) == true){
		error = "Er bestaat al een Stagebegeleider met hetzelfde gebruiksnaam";
		request.setAttribute("message",error);
		}
		
		else{
			
				User newUser = new Stagebegeleider(username,password);
				admin.createUser(newUser);
				succes = "Stagebegeleider succesvol toegevoegd!";
				request.setAttribute("message", succes);
			}		
		
		request.getRequestDispatcher("Stagebegeleidertoevoegen.jsp").forward(request, response);
	}
}
			
		
	


