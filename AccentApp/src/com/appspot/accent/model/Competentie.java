package com.appspot.accent.model;


public class Competentie {
	
	private CompetentieItem item;
	private int score;
	
	public Competentie(CompetentieItem cti,int scr ){
		
		item = cti;
		score = scr;	
	}

	public String getCompetentieItem() {
		return item.getItemNaam();
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}
	
	public String toString(){
		return item.getItemNaam() + score;
	}

}
