package com.sist.vo;

import lombok.Data;

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
	CONTENT      NOT NULL VARCHAR2(4000) 
	FOODMAKE     NOT NULL CLOB           
	DATA                  CLOB           

 */
@Data
public class RecipeDetailVO {
   private int no,likecount;
   private String poster,title,chef,chef_poster,
           chef_profile,info1,info2,info3,content
           ,foodmake,data;
}
