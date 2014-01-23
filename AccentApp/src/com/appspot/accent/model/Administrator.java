package com.appspot.accent.model;

import java.util.ArrayList;

import javax.persistence.Entity;


@Entity
public class Administrator extends User {
	
private ArrayList<CompetentieItem> CompetentieItems;
private ArrayList<User> Users;


////////////////////////////////////////////////DAO Implementatie CRUD/////////////////////////////////////////////////////////
	
	public void createCompetentie(CompetentieItem nweComp) {	
		if(nweComp != null){
			CompetentieItems.add(nweComp);
		}
	}
			
	
	public void updateCompetentie(String omschrijving) {
		for(CompetentieItem ci : CompetentieItems ){
			if(omschrijving != null && !omschrijving.equalsIgnoreCase("")){
				ci.setItemNaam(omschrijving);
			}
		}
	}
		
	public void deleteCompetentie(CompetentieItem cti) {
		if(cti != null){
			CompetentieItems.remove(cti);
		}
	}

	//CRUD LEERLING
	
	public void createUser(User newUser) {
		if(newUser != null){
			Users.add(newUser);
		}
	}

	public void updateUser(User newUser) {
		
		//TODO
	}
	
	public void deleteUser(User paramUser){
		if(paramUser != null){
			for(User u : Users){
				if(paramUser.getUsername().equalsIgnoreCase(u.getUsername())){
					Users.remove(paramUser);
				}
			}
		}
	}
	
		
////////////////////////////////////////////////////Administrator Functies///////////////////////////////////////////////////	
	
	public Administrator(String username,String password){
		super(username,password);
		CompetentieItems = new ArrayList<CompetentieItem>();
		Users = new ArrayList<User>();
	}
	
	public ArrayList<CompetentieItem> getAlleCompetentieItems(){
		return CompetentieItems;
	}
	
	
	public ArrayList<User> getAlleUsers(){
		return Users;
		}
	
	
	/* Zoek op Leerling met Naam als Parameter */
	public boolean zoekLeerling( String nm )
	{
		boolean b = false;
		for( User leerling : Users ){
			if(leerling instanceof Leerling && nm.equalsIgnoreCase(leerling.getUsername())){
				b = true;
			}
		}
		return b;
	
	}
	
	/* Zoek op Docent met Naam als Parameter */
	public boolean zoekDocent(String docentnaam){
		boolean b = false;
		for(User u : Users){
			if(u instanceof Docent && u.getUsername().equalsIgnoreCase(docentnaam)){
				b = true;
			}
		}
		return b;
	}
	/*zoekt Stagebegeleider met naam als parameter */
	public boolean zoekBegeleider(String begeleidernaam){
		boolean b = false;
		for (User u: Users){
			if (u instanceof Stagebegeleider && u.getUsername().equalsIgnoreCase(begeleidernaam)){
				b = true;
			}
		}
		return b;
	}
	
	
	public boolean zoekCompetentieItem(String itemNaam){
		boolean b = false;
		for(CompetentieItem c : CompetentieItems){
			if(c.getItemNaam().equalsIgnoreCase(itemNaam)){
				b = true;
			}
			
		}
		return b;
	}

}