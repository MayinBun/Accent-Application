package com.appspot.accent.model;
import java.util.ArrayList;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import com.appspot.accent.dao.Dao;
import com.sun.xml.internal.bind.v2.TODO;

/**
 * Model class which will store the Todo Items
 * 
 * @author Lars Vogel
 * 
 */

@Entity
public class Todo {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;
  private String author;

  private String summary;
  private String description;
  private String url;
  boolean finished;
  private String date;
  String rolhouder;
  int uren;
  String prio;

  public Todo(String author, String summary, String description,
      String url, String edt, String pr,String rol,int uur) {
    this.author = author;
    this.summary = summary;
    this.description = description;
    this.url = url;
    this.uren = uur;
    this.date = edt;
    this.prio = pr;
    this.uren = uur;
    this.rolhouder = rol;
    finished = false;
  }
  
  public void setPrio(String newPrio){
	  this.prio = newPrio;
  }
  
  public String getPrio(){
	  return prio;
  }

  public Long getId() {
    return id;
  }
  
  public String getDate(){
	  return date;
  }
  
  public int getUren(){
	  return uren;
  }
  
  public void setUren(int aantal){
	  this.uren = aantal;
  }
  
  public String setDate(String newdate){
	  return this.date = newdate;
  }
  
  public String getRolhouder(){
	  return rolhouder;
  }
  
  public void setRolhouder(String houder){
	  this.rolhouder = houder;
  }

  public String getAuthor() {
    return author;
  }

  public void setAuthor(String author) {
    this.author = author;
  }

  public String getShortDescription() {
    return summary;
  }

  public void setShortDescription(String shortDescription) {
    this.summary = shortDescription;
  }

  public String getLongDescription() {
    return description;
  }

  public void setLongDescription(String longDescription) {
    this.description = longDescription;
  }

  public String getUrl() {
    return url;
  }

  public void setUrl(String url) {
    this.url = url;
  }

  public boolean isFinished() {
    return finished;
  }

  public void setFinished(boolean finished) {
    this.finished = finished;
  }
  

} 
