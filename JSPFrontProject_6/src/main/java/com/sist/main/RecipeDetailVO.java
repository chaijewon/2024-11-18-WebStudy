package com.sist.main;
/*
 *  NO           NOT NULL NUMBER         
POSTER       NOT NULL VARCHAR2(4000) 
TITLE        NOT NULL VARCHAR2(1000) 
CHEF         NOT NULL VARCHAR2(1000) 
CHEF_POSTER  NOT NULL VARCHAR2(1000) 
CHEF_PROFILE NOT NULL VARCHAR2(1000) 
INFO1        NOT NULL VARCHAR2(100)  
INFO2        NOT NULL VARCHAR2(100)  
INFO3        NOT NULL VARCHAR2(100)  
CONTENT               VARCHAR2(4000) 
FOODMAKE     NOT NULL CLOB           
DATA                  CLOB           

 */
public class RecipeDetailVO {
	private int no;
	private String poster;
	private String title;
	private String chef;
	private String chef_poster;
	private String chef_profile;
	private String info1,info2,info3;
	private String content;
	private String foodmake;
	private String data;
	
	public String getData() {
		return data;
	}
	public void setData(String data) {
		this.data = data;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getPoster() {
		return poster;
	}
	public void setPoster(String poster) {
		this.poster = poster;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getChef() {
		return chef;
	}
	public void setChef(String chef) {
		this.chef = chef;
	}
	public String getChef_poster() {
		return chef_poster;
	}
	public void setChef_poster(String chef_poster) {
		this.chef_poster = chef_poster;
	}
	public String getChef_profile() {
		return chef_profile;
	}
	public void setChef_profile(String chef_profile) {
		this.chef_profile = chef_profile;
	}
	public String getInfo1() {
		return info1;
	}
	public void setInfo1(String info1) {
		this.info1 = info1;
	}
	public String getInfo2() {
		return info2;
	}
	public void setInfo2(String info2) {
		this.info2 = info2;
	}
	public String getInfo3() {
		return info3;
	}
	public void setInfo3(String info3) {
		this.info3 = info3;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getFoodmake() {
		return foodmake;
	}
	public void setFoodmake(String foodmake) {
		this.foodmake = foodmake;
	}
	   
}
