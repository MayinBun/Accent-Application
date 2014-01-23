package com.appspot.accent.model;

import java.util.ArrayList;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Leerling extends User {
	private ArrayList<Competentie> mijnCompetenties;
	
	
	public Leerling(String username,String password){
		super(username,password);
	}
	
	public String mijnCompetentieLijst(){
		
		String s = null;
		for (Competentie c : mijnCompetenties){
			
			s = c.getCompetentieItem() + c.getScore();
		}
		return s;
	}
	
	public String toString(){
		return super.getUsername() + super.getPassword();
	}
	
	public ArrayList<Competentie> getMijnCompetentiesArray(){
		if(mijnCompetenties == null){
			mijnCompetenties = new ArrayList<Competentie>();
		}
		return mijnCompetenties;
	}

}
