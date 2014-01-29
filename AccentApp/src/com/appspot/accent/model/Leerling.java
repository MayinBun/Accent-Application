package com.appspot.accent.model;

import java.util.ArrayList;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Transient;

@Entity
public class Leerling extends User {
	@Transient
	ArrayList<CompetentieItem> leerlingItems;
	
	public Leerling(String username,String password){
		super(username,password);
		leerlingItems = new ArrayList<CompetentieItem>();
	}
	
	@Transient
	public ArrayList<CompetentieItem> getLeerlingItems(){
		return leerlingItems;
	}
	
	@Transient
	public void VoegItemToe(CompetentieItem ci){
		getLeerlingItems().add(ci);
	}
	
	



}
