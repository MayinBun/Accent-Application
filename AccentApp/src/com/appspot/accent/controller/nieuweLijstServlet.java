package com.appspot.accent.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.appspot.accent.dao.Dao;
import com.appspot.accent.model.CompetentieItem;
import com.appspot.accent.model.Docent;
import com.appspot.accent.model.Leerling;



public class nieuweLijstServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException{
		
	}
		protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
			
			Docent d = (Docent)req.getSession().getAttribute("userobject");
			String leerlingid = req.getParameter("selectedleerling");
			String[] items =req.getParameterValues("competenties");
			Leerling leerling = Dao.INSTANCE.vindLeerling(Long.parseLong(leerlingid));
			ArrayList<CompetentieItem> newList = new ArrayList<CompetentieItem>();
			
			System.out.println(leerling.getUsername());
			for(Leerling l : d.getMijnLeerlingen()){
				for (String s : items){
					CompetentieItem newItem = new CompetentieItem(s);
					newList.add(newItem);
					System.out.println(s);
					l.getLeerlingItems().add(newItem);
				}
				
				
				System.out.println("Lijst toegewezen aan" + l.getUsername());
				
			
			}
			getServletContext().setAttribute("competentieLijst", newList);
			req.getRequestDispatcher("nieuwelijst.jsp").forward(req, res);
		}
					
}
