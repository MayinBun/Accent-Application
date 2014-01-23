package com.appspot.accent.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="CompetentieItems")
public class CompetentieItem implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id 
	@GeneratedValue(strategy = GenerationType.AUTO)
	protected Long id;
	private String naam;

	public CompetentieItem(String competentienaam) {
		
		naam = competentienaam;
	}

	public String getItemNaam(){
		return naam;
	}
	
	public void setItemNaam(String compnaam){
		this.naam = compnaam;
		}	
	
	public long getId(){
		return id;
	}

}
