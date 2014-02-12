package com.appspot.accent.controller;
import com.appspot.accent.dao.Dao;
import com.appspot.accent.model.*;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class KoppelLeerlingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String error;
		String succes;
		ArrayList<Leerling> newLijst = new ArrayList<Leerling>();
		String id = request.getParameter("id");
		Object ojb = request.getSession().getAttribute("userobject");
		Docent d = (Docent)ojb;
		
		Leerling l = Dao.INSTANCE.vindLeerling(Long.parseLong(id));
		newLijst.add(l);
		
		d.getDocentLeerlingen().add(l);
				
		response.sendRedirect("lijstLeerlingen.jsp");
	}
}
			
		
	


