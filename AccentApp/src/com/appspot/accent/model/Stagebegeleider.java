package com.appspot.accent.model;

import java.util.ArrayList;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Transient;

@Entity
public class Stagebegeleider extends User {
	@Transient
	private ArrayList<CompetentieItem> begeleiderItems; 
	
	public Stagebegeleider(String username,String password){
		super(username,password);
		begeleiderItems = new ArrayList<CompetentieItem>();
	}
	
	@Transient
	public void voegBegeleiderItem(CompetentieItem ci){
		begeleiderItems.add(ci);
	}
	
	@Transient
	public ArrayList<CompetentieItem> getBegeleiderItems(){
		return begeleiderItems;
	}

}


