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
		boolean isValid = false;
		
		
		
		Administrator admin = (Administrator)(getServletContext().getAttribute( "admin" ));
	// het aanmaken van een competentie , die niet verbonden is aan een leerling.
	// het is ook mogelijk om tijdens het aanmaken van een competentie de leerling er gelijk aan te
	// koppelen
	
		for(CompetentieItem ci : admin.getAlleCompetentieItems()){
			
			if(!ci.getItemNaam().equalsIgnoreCase(nwNaam)){
				CompetentieItem nweCti = new CompetentieItem(nwNaam);
				Dao.INSTANCE.createCompetentieItem(nwNaam);
				admin.createCompetentie(nweCti);
				succes = "Competentie succesvol toegevoegd!";
				request.setAttribute("message", succes);
				isValid = true;
		}
		else{
		error = "Er bestaat al een competentie met hetzelfde naam";
		request.setAttribute("message",error);}
		break;
		}
			
			
		
		if(isValid == true){
			request.getRequestDispatcher("Competentiestoevoegen.jsp").forward(request, response);
		}
		else{request.getRequestDispatcher("Competentiestoevoegen.jsp").forward(request, response);}
	}
}
			
		
	


