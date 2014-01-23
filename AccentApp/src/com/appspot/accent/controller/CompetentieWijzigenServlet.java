package com.appspot.accent.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.appspot.accent.model.*;

public class CompetentieWijzigenServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String error;
		String succes;
		String nwNaam = request.getParameter("compnaam");
		String nrstring = request.getParameter("competentieitem");
		int nr = Integer.parseInt(nrstring);
		boolean isValid = false;
		
		Administrator admin = (Administrator)(getServletContext().getAttribute( "admin" ));
		for(CompetentieItem ci:admin.getAlleCompetentieItems()){
		
				if(admin.zoekCompetentieItem(nwNaam) == true){
				error = "Er bestaat al een competentie met hetzelfde naam";
				request.setAttribute("message", error);
				break;	
			
				
			}
			else if(!ci.getItemNaam().equalsIgnoreCase(nwNaam)){
				succes = "Competentie succesvol gewijzigd!";
				request.setAttribute("message", succes);
				ci.setItemNaam(nwNaam);
				isValid = true;	
			
			
			}
		
		}
		
		request.getRequestDispatcher("Competentieswijzigen.jsp").forward(request, response);
		}
	}

			
		
	


