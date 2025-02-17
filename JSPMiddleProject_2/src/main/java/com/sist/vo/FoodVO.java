package com.sist.vo;
/*
 *   FNO  NOT NULL NUMBER
 NAME NOT NULL VARCHAR2(500)
 TYPE NOT NULL VARCHAR2(100)
 PHONE NOT NULL VARCHAR2(20)
 ADDRESS NOT NULL VARCHAR2(700)
 SCORE NUMBER(2,1)
 THEME NOT NULL CLOB
 POSTER NOT NULL VARCHAR2(300)
 IMAGES  VARCHAR2(4000)
 TIME   NOT NULL VARCHAR2(100)
 PARKING  VARCHAR2(200)
 CONTENT NOT NULL CLOB
 HIT  NUMBER
 PRICE  VARCHAR2(30)
 */

public class FoodVO {
    private int fno,hit;
    private double score;
    private String name,type,phone,address,theme,poster,
                   images,time,parking,content,price;
	public int getFno() {
		return fno;
	}
	public void setFno(int fno) {
		this.fno = fno;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public double getScore() {
		return score;
	}
	public void setScore(double score) {
		this.score = score;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getTheme() {
		return theme;
	}
	public void setTheme(String theme) {
		this.theme = theme;
	}
	public String getPoster() {
		return poster;
	}
	public void setPoster(String poster) {
		this.poster = poster;
	}
	public String getImages() {
		return images;
	}
	public void setImages(String images) {
		this.images = images;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getParking() {
		return parking;
	}
	public void setParking(String parking) {
		this.parking = parking;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	  
}
