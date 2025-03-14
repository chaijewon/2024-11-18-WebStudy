package com.sist.vo;
/*
 *   CNO        NOT NULL NUMBER       
= RNO                 NUMBER       
= TYPE                NUMBER       
= ID                  VARCHAR2(20) 
= NAME       NOT NULL VARCHAR2(52) 
= SEX                 VARCHAR2(20) 
MSG        NOT NULL CLOB         
= LIKECOUNT           NUMBER       
= GROUP_ID            NUMBER       
= GROUP_STEP          NUMBER       
= GROUP_TAB           NUMBER       
= DEPTH               NUMBER       
= ROOT                NUMBER       
= REGDATE             DATE         

 */
import java.util.*;

import lombok.Data;
@Data
public class ReplyVO {
  private int cno,rno,type,group_id,group_step,group_tab,depth,root,
              likecount;
  private String id,name,sex,msg,dbday;
  private Date regdate;
}
