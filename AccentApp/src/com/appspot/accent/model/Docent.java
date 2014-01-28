package com.appspot.accent.model;

import java.util.ArrayList;

import javax.persistence.Entity;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;

@Entity
public class Docent extends User{
	
	private static final long serialVersionUID = 1L;
	
	public Docent(String username,String password){
		super(username,password);
	}

}
