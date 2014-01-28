package com.appspot.accent.model;

import java.util.ArrayList;

import javax.persistence.Entity;
import javax.persistence.Transient;


@Entity
public class Administrator extends User {
	@Transient
	private ArrayList<CompetentieItem> CompetentieItems;

	public Administrator(String username,String password){
		super(username,password);
		CompetentieItems = new ArrayList<CompetentieItem>();
	}
	
	public void createCompetentie(CompetentieItem nweComp) {	
			CompetentieItems.add(nweComp);
		
	}
	
	public ArrayList<CompetentieItem> getAlleCompetentieItems(){
		return CompetentieItems;
	}
	

	
	


}