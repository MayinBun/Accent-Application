package com.appspot.accent.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.appspot.accent.model.Administrator;
import com.appspot.accent.model.CompetentieItem;



public class CompetentiesVerwijderenServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	protected synchronized void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Administrator admin = (Administrator)(getServletContext().getAttribute( "admin" ));
		ArrayList<CompetentieItem> lijst = admin.getAlleCompetentieItems();
		String item = request.getParameter("id");
		String error;
		String succes;
			
		try{
			for(CompetentieItem cti:lijst){
				
				if(admin.zoekCompetentieItem(item)){
				lijst.remove(cti);
				succes = "Competentie succesvol verwijderd!";
				request.setAttribute("message", succes);
				request.getRequestDispatcher("Competentiesverwijderen.jsp").forward(request, response);
			}
				else {
				error = "Selecteer een competentie om te verwijderen!";
				request.setAttribute("message", error);
				request.getRequestDispatcher("Competentiesverwijderen.jsp").forward(request, response);
				}
			}	
		}catch(Exception e){e.printStackTrace();}
	
	}
}

		
		
	
		
		
		
	


