package com.appspot.accent.controller;

import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.appspot.accent.model.Administrator;
import com.appspot.accent.model.Competentie;
import com.appspot.accent.model.CompetentieItem;
import com.appspot.accent.model.Docent;

public class KoppelenBeoordelingCompententieServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException{
		
	}
		protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException{
			Administrator admin = (Administrator)(getServletContext().getAttribute( "admin" ));
			int curr=0;

			ArrayList<CompetentieItem> Competentie =  admin.getAlleCompetentieItems();
			for(CompetentieItem ci: Competentie ){
				if (ci.getItemNaam()!=""){
				curr++;
				String radio = req.getParameter("my"+curr);
				int radiowaarde = Integer.parseInt(radio);
				String competentie = ci.getItemNaam();
				CompetentieItem test = new CompetentieItem(competentie);
				
		
				Competentie comp = new Competentie(test,radiowaarde);
				System.out.println(comp.getScore()+" "+comp.getCompetentieItem());
		
			
				}
				
				
			}	
		
		}
}
