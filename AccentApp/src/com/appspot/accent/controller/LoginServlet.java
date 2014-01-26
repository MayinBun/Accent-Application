package com.appspot.accent.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.appspot.accent.dao.Dao;
import com.appspot.accent.model.Administrator;
import com.appspot.accent.model.Docent;
import com.appspot.accent.model.Leerling;
import com.appspot.accent.model.Stagebegeleider;
import com.appspot.accent.model.User;



public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private ArrayList<User>users;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		Logger logger = Logger.getLogger("Accent-Logger");
		RequestDispatcher rd = null;
		String inlogtype = request.getParameter("type");
		String username = request.getParameter("US").trim();
		String password = request.getParameter("PW").trim();
		String error;
		boolean found = false;
		
		Object obj = getServletContext().getAttribute("userList");
		users = (ArrayList<User>) (obj);
		List<User> leerlingen = Dao.INSTANCE.getAlleLeerlingen();
		List<User> docenten = Dao.INSTANCE.getAlleDocenten();
		
		//Checken of het een leerling is
	if(inlogtype.equals("Leerling")){
		found = false;
		for(User l : leerlingen){
			
			if(l.getUsername().equalsIgnoreCase(username) && l.getPassword().equalsIgnoreCase(password)){
				response.addCookie(new Cookie("cUS",username));
				request.getSession().setAttribute( "userobject", l );
				logger.info("Ingelogd als Leerling");
				found = true;
				break;
			
			}
		}
		
	}
	else if(inlogtype.equals("Docent")){
		
		found = false;
		//Checken of het een docent is
			
			for(User d : docenten){
				if(d.getUsername().equalsIgnoreCase(username) && d.getPassword().equalsIgnoreCase(password)){
				response.addCookie(new Cookie("cUS",username));
				request.getSession().setAttribute( "userobject", d );
				logger.info("Ingelogd als Docent");
				found = true;
				break;

				}
			}
	}
	else if(inlogtype.equals("Administrator")){
		found = false;
			for(User d : users){
				if(d.getUsername().equalsIgnoreCase(username) && d.getPassword().equalsIgnoreCase(password) && d instanceof Administrator){
				response.addCookie(new Cookie("cUS",username));
				request.getSession().setAttribute( "userobject", d );
				logger.info("Ingelogd als Administrator");
				found = true;
				break;
				
				}
			}
	}
	else if(inlogtype.equals("Stagebegeleider")){		
		found = false;
			for(User s : users){
				if(s.getUsername().equalsIgnoreCase(username) && s.getPassword().equalsIgnoreCase(password) && s instanceof Stagebegeleider){
				response.addCookie(new Cookie("cUS",username));
				logger.info("Ingelogd als Stagebegeleider"); 
				found = true;
				break;
						
				}
			}
	}
	
	if(!found){
		error = "Je gebruiksnaam en/of je wachtwoord zijn niet juist.";
		request.setAttribute("error", error);
		rd = request.getRequestDispatcher("Inloggen.jsp");
		rd.forward(request, response);
	}
	
	else{
		rd = request.getRequestDispatcher( "Index.jsp" );
		session.setAttribute("LoggedUser", username);
		rd.forward(request, response);
	}
	
		
}	

}
