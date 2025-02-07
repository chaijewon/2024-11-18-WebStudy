package com.sist.vo;
// 자료실
// => upload / download 
/*
 *   1. DAO => 데이터베이스 설계 
 *            --------------
 *             데이터 수집 
 *   2. VO 설정 
 *      HTML 화면 UI => CSS(약간) 
 *      JavaScript => 브라우저 처리 
 *      => Basic 
 *      => Jquery => Vue / React 
 *      
 *   3. 전송값 / 출력값 
 *      <a> , <form>
 *      
 *   
 */
/*
 *   NO       NOT NULL NUMBER         
NAME     NOT NULL VARCHAR2(51)   
SUBJECT  NOT NULL VARCHAR2(2000) 
CONTENT  NOT NULL CLOB           
PWD      NOT NULL VARCHAR2(10)   
REGDATE           DATE           
HIT               NUMBER         
FILENAME          VARCHAR2(260)  
FILESIZE          NUMBER    
 */
import java.util.*;

import lombok.Data;
@Data
public class DataBoardVO {
   private int no,hit,filesize;
   private String name,subject,content,pwd,filename;
   private Date regdate;
}









