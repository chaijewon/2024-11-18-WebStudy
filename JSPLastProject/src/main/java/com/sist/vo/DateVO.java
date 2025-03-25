package com.sist.vo;

import lombok.Data;

/*
 *   RNO  NOT NULL NUMBER        
     RDAY NOT NULL NUMBER        
     TIME NOT NULL VARCHAR2(200) 
 */
@Data
public class DateVO {
   private int rno,rday;
   private String time;
}
