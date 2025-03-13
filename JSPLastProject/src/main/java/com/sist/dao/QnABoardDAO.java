package com.sist.dao;
import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.commons.*;
import com.sist.vo.*;

public class QnABoardDAO {
   private static SqlSessionFactory ssf;
   static
   {
	   ssf=CreateSqlSessionFactory.getSsf();
   }
   
   /*
    *   <select id="qnaListData" resultType="QnABoardVO" parameterType="hashmap">
		     SELECT no,subject,name,TO_CHAR(regdate,'YYYY-MM-DD') as dbday,hit,group_tab,num
		     FROM (SELECT no,subject,name,regdate,hit,group_tab,rownum as num
		     FROM (SELECT no,subject,name,regdate,hit,group_tab
		     FROM qnaBoard ORDER BY group_id DESC,group_step ASC))
		     WHERE num BETWEEN #{start} AND #{end}
		   </select>
		   <select id="qnaRowCount" resultType="int">
		     SELECT COUNT(*) FROM qnaBoard
		   </select>
		   <!-- 문의 -->
		   <insert id="qnaInsert" parameterType="QnABoardVO">
		    INSERT INTO qnaBoard(no,id,name,subject,content,pwd,group_id) 
		    VALUES((SELECT NVL(MAX(no)+1,1) FROM qnaBoard),
		      #{id},#{name},#{subject},#{content},#{pwd},
		      (SELECT NVL(MAX(group_id)+1,1) FROM qnaBoard))
		   </insert>
    */
   public static List<QnABoardVO> qnaListData(Map map)
   {
	   SqlSession session=ssf.openSession();
	   List<QnABoardVO> list=session.selectList("qnaListData",map);
	   session.close();
	   return list;
   }
   public static int qnaRowCount() {
	   SqlSession session=ssf.openSession();
	   int count=session.selectOne("qnaRowCount");
	   session.close();
	   return count;
   }
   public static void qnaInsert(QnABoardVO vo)
   {
	   SqlSession session=ssf.openSession(true);
	   session.insert("qnaInsert",vo);
	   session.close();
   }
   /*
    *   <select id="qnaAdminListData" resultType="QnABoardVO" parameterType="hashmap">
	     SELECT no,subject,name,TO_CHAR(regdate,'YYYY-MM-DD') as dbday,hit,group_tab,group_id,group_step,anok,num
	     FROM (SELECT no,subject,name,regdate,hit,group_tab,group_id,group_step,anok,rownum as num
	     FROM (SELECT no,subject,name,regdate,hit,group_tab,group_id,group_step,anok
	     FROM qnaBoard WHERE group_step=0 ORDER BY group_id DESC))
	     WHERE num BETWEEN #{start} AND #{end}
	   </select>
	   <select id="qnaAdminRowCount" resultType="int">
	     SELECT COUNT(*) FROM qnaBoard
	     WHERE group_step=0
	   </select>
    */
   public static List<QnABoardVO> qnaAdminListData(Map map)
   {
	   SqlSession session=ssf.openSession();
	   List<QnABoardVO> list=session.selectList("qnaAdminListData",map);
	   session.close();
	   return list;
   }
   public static int qnaAdminRowCount() {
	   SqlSession session=ssf.openSession();
	   int count=session.selectOne("qnaAdminRowCount");
	   session.close();
	   return count;
   }
   
}





