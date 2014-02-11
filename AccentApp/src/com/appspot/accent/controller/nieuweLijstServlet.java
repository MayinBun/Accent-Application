package com.appspot.accent.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.appspot.accent.dao.Dao;
import com.appspot.accent.model.Docent;
import com.appspot.accent.model.Leerling;
import com.appspot.accent.model.Omschrijving;



public class nieuweLijstServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException{
		
	}
		protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
			
			Docent d = (Docent)req.getSession().getAttribute("userobject");
			String leerlingid = req.getParameter("selectedleerling");
			String[] items =req.getParameterValues("competenties");
			Leerling leerling = Dao.INSTANCE.vindLeerling(Long.parseLong(leerlingid));
		
				for (String s : items){
					Omschrijving newItem = new Omschrijving(s);
					d.getMijnLijst().add(newItem);
					leerling.VoegItemToe(newItem);
				}
				
				res.sendRedirect("nieuwelijst.jsp");
			
			}
			
			
		
			
				
				
			
		
		
}
