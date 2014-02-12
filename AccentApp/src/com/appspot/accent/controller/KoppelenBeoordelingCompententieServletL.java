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
import com.appspot.accent.model.Leerling;

public class KoppelenBeoordelingCompententieServletL extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException{
		
	}
		protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
			Administrator admin = (Administrator)(getServletContext().getAttribute( "admin" ));
			Leerling logged = (Leerling) req.getSession().getAttribute("userobject");
			
			Object o = getServletContext().getAttribute("names");
			ArrayList<String>names = (ArrayList<String>)o;
			names.add(logged.getUsername());
			getServletContext().setAttribute("names",names);
			
			Object o2 = getServletContext().getAttribute("average");
			ArrayList<Integer>average = (ArrayList<Integer>)o2;
			
			int curr=0;
			int total = 0;
			String intstring = "";
			String compstring = "";
				//leerling.getAlleCompetenties
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
				total+=comp.getScore();
				compstring += "'" +comp.getCompetentieItem() + "'" + ",";
			
				}
				
				
			}	
			
			int size = admin.getAlleCompetentieItems().size() - 1;
			total = total / size;
			average.add(total);
			getServletContext().setAttribute("total", total);
			getServletContext().setAttribute("valuel", intstring);
			getServletContext().setAttribute("resultl", compstring);
			req.getRequestDispatcher("Competentiesleerling.jsp").forward(req, res);
		
		}
}
