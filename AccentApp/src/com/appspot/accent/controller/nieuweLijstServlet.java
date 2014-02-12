package com.appspot.accent.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.appspot.accent.dao.Dao;
import com.appspot.accent.model.Administrator;
import com.appspot.accent.model.CompetentieItem;
import com.appspot.accent.model.Docent;
import com.appspot.accent.model.Leerling;



public class nieuweLijstServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException,IOException{
		
	}
		protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
			
			Docent d = (Docent)req.getSession().getAttribute("userobject");
			String[] items =req.getParameterValues("competenties");
			ArrayList<CompetentieItem> newList = new ArrayList<CompetentieItem>();
			
			
				for (String s : items){
					CompetentieItem newItem = new CompetentieItem(s);
					newList.add(newItem);
					System.out.println(s);
				}
				
			
			
			getServletContext().setAttribute("competentieLijst", newList);
			req.getRequestDispatcher("nieuwelijst.jsp").forward(req, res);
			
			
			
		}
					
}
