package com.sist.vo;

import lombok.Data;

/*
 *   MNO                                       NOT NULL NUMBER
 CNO                                                NUMBER
 TITLE                                     NOT NULL VARCHAR2(1000)
 SINGER                                    NOT NULL VARCHAR2(500)
 ALBUM                                     NOT NULL VARCHAR2(500)
 POSTER                                             VARCHAR2(260)
 IDCREMENT                                          NUMBER
 STATE                                              VARCHAR2(30)
 KEY                                                VARCHAR2(200)
 HIT                                                NUMBER
 */

public class MusicVO {
   private int mno,cno,idcrement,hit;
   private String title,singer,album,poster,state,key;
public int getMno() {
	return mno;
}
public void setMno(int mno) {
	this.mno = mno;
}
public int getCno() {
	return cno;
}
public void setCno(int cno) {
	this.cno = cno;
}
public int getIdcrement() {
	return idcrement;
}
public void setIdcrement(int idcrement) {
	this.idcrement = idcrement;
}
public int getHit() {
	return hit;
}
public void setHit(int hit) {
	this.hit = hit;
}
public String getTitle() {
	return title;
}
public void setTitle(String title) {
	this.title = title;
}
public String getSinger() {
	return singer;
}
public void setSinger(String singer) {
	this.singer = singer;
}
public String getAlbum() {
	return album;
}
public void setAlbum(String album) {
	this.album = album;
}
public String getPoster() {
	return poster;
}
public void setPoster(String poster) {
	this.poster = poster;
}
public String getState() {
	return state;
}
public void setState(String state) {
	this.state = state;
}
public String getKey() {
	return key;
}
public void setKey(String key) {
	this.key = key;
}
   
}
