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
@Data
public class MusicVO {
   private int mno,cno,idcrement,hit;
   private String title,singer,album,poster,state,key;
}
