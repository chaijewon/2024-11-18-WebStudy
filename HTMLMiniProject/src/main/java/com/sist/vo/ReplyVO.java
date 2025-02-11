package com.sist.vo;
import java.util.*;

import lombok.Data;
/*
 *  RNO     NOT NULL NUMBER       
	FNO              NUMBER       
	ID               VARCHAR2(20) 
	NAME    NOT NULL VARCHAR2(51) 
	MSG     NOT NULL CLOB         
	REGDATE          DATE 
	
	로그인 ===== id,name,sex (서버에 저장) 
	           -----------------------
	           | 모든 파일에서 사용이 가능 (로그아웃 / 브라우저 종료시까지 사용)
	             -------------------- 전역변수 
	             => 1. 사용자 정보 
	             => 2. 장바구니 
	             => 3. 경매 
	             => 저장 기간 : 1800초 (30분) 
	             => session : 프로그램이 실행되는 동안 
	             => 각 클라이언트당 1개 배정 
	                   ---------------- request
	                ------- 브라우저에 대해서 
	                
	       VO => 컬럼외의 변수를 설정 
	             => JDBC / MyBatis
	             => SQL문장을 전송 (사용자)
	       Entity => 컬럼외의 변수는 설정이 불가능
	             => JPA => SQL을 자동화 
	             
 */

public class ReplyVO {
   private int rno,fno;
   private String id,name,msg,dbday;
   private Date regdate;
public int getRno() {
	return rno;
}
public void setRno(int rno) {
	this.rno = rno;
}
public int getFno() {
	return fno;
}
public void setFno(int fno) {
	this.fno = fno;
}
public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getMsg() {
	return msg;
}
public void setMsg(String msg) {
	this.msg = msg;
}
public String getDbday() {
	return dbday;
}
public void setDbday(String dbday) {
	this.dbday = dbday;
}
public Date getRegdate() {
	return regdate;
}
public void setRegdate(Date regdate) {
	this.regdate = regdate;
}
   
}
