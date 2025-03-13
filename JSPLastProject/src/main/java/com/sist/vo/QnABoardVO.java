package com.sist.vo;
/*
 *  NO         NOT NULL NUMBER         
	ID                  VARCHAR2(20)   
	NAME       NOT NULL VARCHAR2(52)   
	SUBJECT    NOT NULL VARCHAR2(2000) 
	CONTENT    NOT NULL CLOB           
	PWD        NOT NULL VARCHAR2(10)   
	REGDATE             DATE           
	HIT                 NUMBER         
	GROUP_ID            NUMBER         
	GROUP_STEP          NUMBER         
	GROUP_TAB           NUMBER         
	ANOK                CHAR(1)        

 */
import java.util.*;

import lombok.Data;
@Data
public class QnABoardVO {
   private int no,hit,group_id,group_step,group_tab;
   private String name,id,subject,content,pwd,anok,dbday;
   private Date regdate;
}
