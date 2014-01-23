package com.appspot.accent.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.logging.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.appspot.accent.model.Administrator;
import com.appspot.accent.model.Docent;
import com.appspot.accent.model.Leerling;
import com.appspot.accent.model.Stagebegeleider;
import com.appspot.accent.model.User;



public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private ArrayList<User>users;
    private boolean isLeerling = false;
	private boolean isDocent = false;
	private boolean isAdmin = false;
	private boolean isStagebegeleider=false;
	private boolean found = false;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		Logger logger = Logger.getLogger("Accent-Logger");
		RequestDispatcher rd = null;
		String type = null;
		String username = request.getParameter("US").trim();
		String password = request.getParameter("PW").trim();
		String error;

		
		Object obj = getServletContext().getAttribute("userList");
		users = (ArrayList<User>) (obj);
	
		//Checken of het een leerling is
		if(users !=null){
			
		for(User l : users){
			
			if(l.getUsername().equalsIgnoreCase(username) && l.getPassword().equalsIgnoreCase(password) && l instanceof Leerling){
			isLeerling = true;
			type = "Leerling";
			request.getSession().setAttribute( "userobject", l );
			logger.info("Ingelogd als Leerling");
			found = true;
			break;
			
			
			}
		}
		
		}
		
		
		//Checken of het een admin is
			
			for(User a : users){
				if(a.getUsername().equalsIgnoreCase(username) && a.getPassword().equalsIgnoreCase(password) && a instanceof Administrator){
				isAdmin = true;
				type = "Admin";
				request.getSession().setAttribute( "userobject", a );
				logger.info("Ingelogd als Administrator");
				found = true;
				break;

				}
			}
		
		
		
		
		
			
			for(User d : users){
				if(d.getUsername().equalsIgnoreCase(username) && d.getPassword().equalsIgnoreCase(password) && d instanceof Docent){
				isDocent = true;
				type = "Docent";
				request.getSession().setAttribute( "userobject", d );
				logger.info("Ingelogd als Docent");
				found = true;
				break;
				
				}
			}
			
					
			for(User s : users){
				if(s.getUsername().equalsIgnoreCase(username) && s.getPassword().equalsIgnoreCase(password) && s instanceof Stagebegeleider){
				isStagebegeleider = true;
				type = "Stagebegeleider";
				logger.info("Ingelogd als Stagebegeleider"); 
				found = true;
				break;
						
				}
			}
					
		if(isLeerling == true && found == true){
			response.addCookie(new Cookie("cUS",username));
			session.setAttribute("LoggedUser", username);
			session.setAttribute("type", type);
	
			response.sendRedirect("Index.jsp");
			
			
		}
		
		else if(isAdmin == true && found == true){
			response.addCookie(new Cookie("cUS",username));
			session.setAttribute("LoggedUser", username);
			session.setAttribute("type", type);
				
			response.sendRedirect("Index.jsp");
		}
		
		else if(isDocent == true && found == true){
			response.addCookie(new Cookie("cUS",username));
			session.setAttribute("LoggedUser", username);
			session.setAttribute("type", type);
			
			response.sendRedirect("Index.jsp");
			
		}
		
		else if(isStagebegeleider == true && found == true){
			response.addCookie(new Cookie("cUS",username));
			session.setAttribute("LoggedUser", username);
			session.setAttribute("type", type);
			
			response.sendRedirect("Index.jsp");
			
		}
		

		else {
			error = "Je gebruiksnaam en/of je wachtwoord zijn niet juist.";
			request.setAttribute("error", error);
			rd = request.getRequestDispatcher("Inloggen.jsp");
			rd.forward(request, response);
		}
	}	

}
