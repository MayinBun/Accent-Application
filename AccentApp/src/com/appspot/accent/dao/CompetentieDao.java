package com.appspot.accent.dao;

import com.appspot.accent.model.CompetentieItem;

public interface CompetentieDao {

	
	
	//CRUD uitsluitend bedoeld voor de Administrator//
	
	
	public void createCompetentie(CompetentieItem nweComp);
	
	public void updateCompetentie(String omschrijving);
	
	public void deleteCompetentie(CompetentieItem comp);

	
	
	
	
	
}
