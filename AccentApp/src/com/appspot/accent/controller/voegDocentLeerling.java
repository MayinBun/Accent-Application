package com.appspot.accent.controller;
import com.appspot.accent.model.*;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class voegDocentLeerling extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String error;
		String succes;
		String Leerling = request.getParameter("leerling");
/*		Leerling l = new Leerling(Leerling);
		TODO: zorgen dat de tabel gevult wordt met een arraylist
		Docent d =(Docent) request.getSession().getAttribute("LoggedUser");
		
		d.voegLeerlingtoe(l);*/
		
	
		request.getRequestDispatcher("Docenttoevoegen.jsp").forward(request, response);
	}
}
			
		