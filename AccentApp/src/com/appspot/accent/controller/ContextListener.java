package com.appspot.accent.controller;

import java.util.ArrayList;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import com.appspot.accent.dao.Dao;
import com.appspot.accent.model.Administrator;
import com.appspot.accent.model.CompetentieItem;
import com.appspot.accent.model.Docent;
import com.appspot.accent.model.Leerling;
import com.appspot.accent.model.Stagebegeleider;
import com.appspot.accent.model.User;



public class ContextListener implements ServletContextListener {

	
	private ArrayList<User> users = new ArrayList<User>();
	private ArrayList<Leerling> leerlingen = new ArrayList<Leerling>();
	private ArrayList<String> names = new ArrayList<String>();
	private ArrayList<Integer> average = new ArrayList<Integer>();
    public void contextInitialized(ServletContextEvent sce) {
    	
    	Administrator admin = new Administrator("admin","admin");
    	users.add(admin);
    	
    	Leerling l = new Leerling("ingo","ingo");
    	leerlingen.add(l);
    	
    	//Demo lijst
    	CompetentieItem c = new CompetentieItem("");
    	CompetentieItem c1 = new CompetentieItem("1. Samenwerken en overleggen");
    	CompetentieItem c2 = new CompetentieItem("2. Aandacht en begrip tonen");
    	CompetentieItem c3 = new CompetentieItem("3. Klantvriendelijk en dienstverlenend");
    	CompetentieItem c4 = new CompetentieItem("4. Instructies en procedures opvolgen	");
    	CompetentieItem c5 = new CompetentieItem("5. Plannen en organiseren");
    	
    	CompetentieItem c6 = new CompetentieItem("1. Is enthousiast");
    	CompetentieItem c7 = new CompetentieItem("2. Kan goed luisteren");
    	CompetentieItem c8 = new CompetentieItem("3. Klantvriendelijk en dienstverlenend");
    	CompetentieItem c9 = new CompetentieItem("4. Instructies en procedures opvolgen	");
    	CompetentieItem c10 = new CompetentieItem("5. Plannen en organiseren");
    	
    	admin.createCompetentie(c);
    	admin.createCompetentie(c1);
    	admin.createCompetentie(c2);
    	admin.createCompetentie(c3);
    	admin.createCompetentie(c4);
    	admin.createCompetentie(c5);
    	
    	l.VoegItemToe(c);
    	l.VoegItemToe(c6);
    	l.VoegItemToe(c7);
    	l.VoegItemToe(c8);
    	l.VoegItemToe(c9);
    	l.VoegItemToe(c10);
    	
    	Dao.INSTANCE.createAdministrator("admin", "admin");
    	
    	//Context attributen
    	sce.getServletContext().setAttribute("admin", admin);
    	sce.getServletContext().setAttribute("userList", users);
    	sce.getServletContext().setAttribute("leerlingen", leerlingen);
    	sce.getServletContext().setAttribute("names", names);
    	sce.getServletContext().setAttribute("average", average);
    }

	
    public void contextDestroyed(ServletContextEvent sce) {
        // TODO Auto-generated method stub
    }
	
}
