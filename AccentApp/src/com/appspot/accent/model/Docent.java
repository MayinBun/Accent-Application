package com.appspot.accent.model;

import java.util.ArrayList;

import javax.persistence.Entity;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;

@Entity
public class Docent extends User{
	
	private static final long serialVersionUID = 1L;
	
	/*
	@ManyToMany
	private ArrayList<Leerling> mijnLeerlingen;
	*/
	public Docent(String username,String password){
		super(username,password);
	}
	/*
	public ArrayList<Leerling> getAlleLeerlingen(){
		if(mijnLeerlingen == null){
		mijnLeerlingen = new ArrayList<Leerling>();
	}
		return mijnLeerlingen;
	}
	
	public void voegLeerlingtoe(Leerling l){
		if(l != null){
		mijnLeerlingen.add(l);
		}
	}
*/
}
