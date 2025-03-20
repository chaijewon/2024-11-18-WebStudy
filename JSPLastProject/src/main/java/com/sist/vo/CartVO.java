package com.sist.vo;
/*
 *  CNO     NOT NULL NUMBER       
GNO              NUMBER       
ID               VARCHAR2(20) 
ACCOUNT          NUMBER       
PRICE            NUMBER       
ISBUY            CHAR(1)      
REGDATE          DATE         

 */
import java.util.*;

import lombok.Data;
@Data
public class CartVO {
  private int cno,gno,account,price;
  private String id;
  private Date regdate;
  private GoodsVO gvo=new GoodsVO();
  private MemberVO mvo=new MemberVO();
}
