package com.appspot.accent.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.appspot.accent.dao.Dao;
import com.appspot.accent.model.Administrator;
import com.appspot.accent.model.CompetentieItem;



public class CompetentiesVerwijderenServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	protected synchronized void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id");
		Dao.INSTANCE.removeCompetentieItem(Long.parseLong(id));
		request.getRequestDispatcher("CompetentiesBeheer.jsp").forward(request, response);
	
	}
}

		
		
	
		
		
		
	


