package com.sist.dao;
import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.vo.*;
import com.sist.commons.*;
public class NoticeDAO {
   private static SqlSessionFactory ssf;
   static
   {
	   ssf=CreateSqlSessionFactory.getSsf();
   }
   /*
    *   <select id="noticeListData" resultType="NoticeVO" parameterType="hashmap">
	    SELECT no,subject,name,TO_CHAR(regdate,'YYYY-MM-DD') as dbday,hit,num
	    FROM (SELECT no,subject,name,regdate,hit,rownum as num 
	    FROM (SELECT no,subject,name,regdate,hit
	    FROM project_notice ORDER BY no DESC))
	    WHERE num BETWEEN #{start} AND #{end}
	  </select>
	  <select id="noticeTotalPage" resultType="int">
	   SELECT CEIL(COUNT(*)/10.0) FROM project_notice
	  </select>
	  <insert id="noticeInsert" parameterType="NoticeVO">
	   INSERT INTO project_notice(no,type,subject,content) VALUES(
	    pn_no_seq.nextval,#{type},#{subject},#{content}
	   )
	 </insert>
    */
   public static List<NoticeVO> noticeListData(Map map)
   {
 	  SqlSession session=ssf.openSession();
 	  List<NoticeVO> list=session.selectList("noticeListData",map);
 	  session.close();
 	  return list;
   }
   public static int noticeTotalPage()
   {
 	  SqlSession session=ssf.openSession();
 	  int total=session.selectOne("noticeTotalPage");
 	  session.close();
 	  return total;
   }
   public static void noticeInsert(NoticeVO vo)
   {
 	  SqlSession session=ssf.openSession(true);
 	  session.insert("noticeInsert",vo);
 	  session.close();
   }
   /*
    *   <update id="noticeHitIncrement" parameterType="int">
		  UPDATE project_notice SET
		  hit=hit+1
		  WHERE no=#{no}
		 </update>
		 <select id="noticeDetailData" parameterType="int">
		  SELECT no,type,name,subject,content,hit,TO_CHAR(regdate,'YYYY-MM-DD HH24:MI:SS') as dbday
		  FROM project_notice
		  WHERE no=#{no}
		 </select>
		 
		 user 
		   noticeDetailData(2,1)
		 관리자
		   noticeDetailData(2,0)
    */
   public static NoticeVO noticeDetailData(int no,int mode)
   {
 	  // 트랜잭션 
 	  SqlSession session=ssf.openSession();
 	  if(mode==1)
 	  {
 	   session.update("noticeHitIncrement",no);
 	   session.commit();
 	  }
 	  NoticeVO vo=session.selectOne("noticeDetailData",no);
 	  session.close();
 	  return vo;
   }
}
