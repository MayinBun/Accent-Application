package com.appspot.accent.controller;
import com.appspot.accent.dao.Dao;
import com.appspot.accent.model.*;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class CompetentieToevoegenServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String error;
		String succes;
		String nwNaam = request.getParameter("compnaam");
		
		
		if(!nwNaam.equalsIgnoreCase("")){
			Dao.INSTANCE.createCompetentieItem(nwNaam);
			succes = "Competentie aangemaakt!";
			request.setAttribute("message",succes);
		}
		
		else{error = "Omschrijving mag niet leeg zijn"; request.setAttribute("message", error);}
		
		response.sendRedirect("CompetentiesBeheer.jsp");
		
		
	}
}
		
	


