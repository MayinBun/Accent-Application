package com.appspot.accent.model;

import java.awt.List;
import java.util.ArrayList;

import javax.persistence.Entity;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Transient;

@Entity
public class Docent extends User{
	
	private static final long serialVersionUID = 1L;
	
	
	@Transient
	private ArrayList<Leerling> mijnLeerlingen;
	
	public Docent(String username,String password){
		super(username,password);
		mijnLeerlingen = new ArrayList<Leerling>();
	}
	
	@Transient
	public void voegLeerlingToe(Leerling l){
		mijnLeerlingen.add(l);
	}

}
