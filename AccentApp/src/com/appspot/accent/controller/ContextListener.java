package com.appspot.accent.controller;

import java.util.ArrayList;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import com.appspot.accent.model.Administrator;
import com.appspot.accent.model.CompetentieItem;
import com.appspot.accent.model.Docent;
import com.appspot.accent.model.Leerling;
import com.appspot.accent.model.Stagebegeleider;
import com.appspot.accent.model.User;



public class ContextListener implements ServletContextListener {

	
	private ArrayList<User> users = new ArrayList<User>();
    public void contextInitialized(ServletContextEvent sce) {
    	
    	Administrator admin = new Administrator("admin","admin");
    	admin.createUser(admin);
    	ArrayList<CompetentieItem> items = admin.getAlleCompetentieItems();
    	//aanmaken van de Stagebegeleider
    	User l3 = new Stagebegeleider("begeleider","begeleider");
    	admin.createUser(l3);
    	//aanmaken van een Leerling
    	User l1 = new Leerling("leerling","leerling");
    	admin.createUser(l1);
    	//aanmaken van een Leerling
    	User l2 = new Leerling("leerling2","leerling2");
    	admin.createUser(l2);
    	//aanmaken van een Docent
    	User d1 = new Docent("docent","docent");
    	admin.createUser(d1);
    	//aanmaken van een Leerling
    	User testleerling = new Leerling("leerling123,.","leerling123,.");
    	admin.createUser(testleerling);
    	
    	//Voorbeeld collectie 1
    	/* er moet een extra lege competentie bij komen zodat de loop goed werkt */
    	CompetentieItem c = new CompetentieItem("");
    	CompetentieItem c1 = new CompetentieItem("1. Samenwerken en overleggen");
    	CompetentieItem c2 = new CompetentieItem("2. Aandacht en begrip tonen");
    	CompetentieItem c3 = new CompetentieItem("3. Klantvriendelijk en dienstverlenend");
    	CompetentieItem c4 = new CompetentieItem("4. Instructies en procedures opvolgen	");
    	CompetentieItem c5 = new CompetentieItem("5. Plannen en organiseren");
    	admin.createCompetentie(c);
    	admin.createCompetentie(c1);
    	admin.createCompetentie(c2);
    	admin.createCompetentie(c3);
    	admin.createCompetentie(c4);
    	admin.createCompetentie(c5);
    	
    	
    	//Context attributen
    	sce.getServletContext().setAttribute("admin", admin);
    	sce.getServletContext().setAttribute("itemList", items);
    	sce.getServletContext().setAttribute("userList", admin.getAlleUsers());
    }

	
    public void contextDestroyed(ServletContextEvent sce) {
        // TODO Auto-generated method stub
    }
	
}
