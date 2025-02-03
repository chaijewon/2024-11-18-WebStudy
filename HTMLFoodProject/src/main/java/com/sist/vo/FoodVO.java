package com.sist.vo;

import lombok.Data;

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
@Data
public class FoodVO {
  private int fno,hit;
  private double score;
  private String name,type,phone,address,theme,poster,
          images,time,parking,content,price;
}
