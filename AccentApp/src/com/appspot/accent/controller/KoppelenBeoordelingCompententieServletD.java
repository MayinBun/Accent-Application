package com.appspot.accent.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.appspot.accent.model.Administrator;
import com.appspot.accent.model.Competentie;
import com.appspot.accent.model.CompetentieItem;
import com.appspot.accent.model.Docent;

public class KoppelenBeoordelingCompententieServletD extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException{
		
	}
		protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
			Administrator admin = (Administrator)(getServletContext().getAttribute( "admin" ));
			int curr=0;
			String intstring = "";
			String compstring = "";

			//Docent.getAlleCompetentieItems
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
				intstring += comp.getScore() + ",";
				compstring += "'" +comp.getCompetentieItem() + "'" + ",";
		
			
				}
				
				
			}	
			getServletContext().setAttribute("valued", intstring);
			getServletContext().setAttribute("resultd", compstring);
			req.getRequestDispatcher("Competentiesleerling.jsp").forward(req, res);
		
		}
}
