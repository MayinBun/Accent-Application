package com.appspot.accent.model;

import java.util.ArrayList;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Stagebegeleider extends User {
	private ArrayList<Competentie> mijnCompetenties; 
	
	public Stagebegeleider(String username,String password){
		// voor het inladen van het standaard account 
		super(username,password);
	}
	
	public String CompetentieLijst(){
		
		String s = null;
		for (Competentie c : mijnCompetenties){
			
			s = c.getCompetentieItem() + c.getScore();
		}
		return s;
	}
	public String toString(){
		return super.getUsername() + super.getPassword();
	}
	public ArrayList<Competentie> getCompetentiesArray(){
		// om de arraylist op te halen.
		if(mijnCompetenties == null){
			mijnCompetenties = new ArrayList<Competentie>();
		}
		return mijnCompetenties;
	}
	
	public Long getId(){
		return id;
	}
}


