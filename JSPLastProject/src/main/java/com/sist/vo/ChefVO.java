package com.sist.vo;

import lombok.Data;

/*
 *      NO        NOT NULL NUMBER        
		CHEF      NOT NULL VARCHAR2(300) 
		POSTER             VARCHAR2(260) 
		MEM_CONT1          VARCHAR2(30)  
		MEM_CONT3          VARCHAR2(30)  
		MEM_CONT7          VARCHAR2(30)  
		MEM_CONT2          VARCHAR2(30) 
 */
@Data
public class ChefVO {
   private int no;
   private String chef,poster,mem_cont1,mem_cont3,mem_cont7,mem_cont2;
}
