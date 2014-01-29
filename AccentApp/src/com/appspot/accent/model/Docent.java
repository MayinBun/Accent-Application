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
	private ArrayList<CompetentieItem> docentItems;
	
	@Transient
	private ArrayList<Leerling> mijnLeerlingen;
		
	public Docent(String username,String password){
		super(username,password);
		docentItems = new ArrayList<CompetentieItem>();
	}
	
	@Transient
	public void VoegDocentItem(CompetentieItem ci){
		docentItems.add(ci);
	}
	
	@Transient
	public ArrayList<CompetentieItem> getDocentItems(){
		return docentItems;
	}
	
	@Transient
	public void voegLeerling(Leerling l){
		mijnLeerlingen.add(l);
	}
	
	@Transient
	public ArrayList<Leerling> getDocentLeerlingen(){
		return mijnLeerlingen;
	}
	
	
	

}
