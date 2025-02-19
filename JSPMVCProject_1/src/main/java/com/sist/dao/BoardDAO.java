package com.sist.dao;
import java.util.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.sist.vo.BoardVO;

import java.io.*;
public class BoardDAO {
  private static SqlSessionFactory ssf;
  // 초기화 => XML에 등록된 데이터를 전송 => ssf
  static
  {
	  try
	  {
		  // 1. XML읽기
		  Reader reader=Resources.getResourceAsReader("Config.xml");
		  // 2. XML파싱 
		  ssf=new SqlSessionFactoryBuilder().build(reader);
	  }catch(Exception ex)
	  {
		  ex.printStackTrace();
	  }
  }
  /*
   *   1.목록
   *     <select id="boardListData" resultType="BoardVO"
		   parameterType="hashmap"
		  >
		     SELECT no,subject,name,regdate,hit,num
		     FROM (SELECT no,subject,name,regdate,hit,rownum as num 
		     FROM (SELECT no,subject,name,regdate,hit 
		     FROM board ORDER BY no ASC))
		     WHERE num BETWEEN #{start} AND #{end}
		  </select>
   *   2.총페이지 
   *      <select id="boardTotalPage" resultType="int">
            SELECT CEIL(COUNT(*)/10.0) FROM board
          </select>
   *   
   */
   public static List<BoardVO> boardListData(Map map)
   {
	   // conn , ps 
	   SqlSession session=ssf.openSession();
	   List<BoardVO> list=session.selectList("boardListData",map);
	   // 목록 => 여러개 selectList 
	   // 상세보기 => 한개 selectOne
	   session.close();
	   return list;
   }
   public static int boardTotalPage()
   {
	   SqlSession session=ssf.openSession();
	   int total=session.selectOne("boardTotalPage");
	   // 목록 => 여러개 selectList 
	   // 상세보기 => 한개 selectOne
	   session.close();
	   return total;
   }
   /*
    *   <insert id="boardInsert" parameterType="BoardVO">
		     <!-- 마이바티스 자동 증가번호 제작 
		          order => BEFORE: 먼저 수행 
		                   AFTER : 나중에 실행 
		                   
		          ${vo.name} ${vo.getName()}
		      -->
		     <selectKey keyProperty="no" resultType="int" order="BEFORE">
		        SELECT NVL(MAX(no)+1,1) as no FROM board
		     </selectKey>
		     INSERT INTO board VALUES(
		       #{no},#{name},#{subject},#{content},
		       #{pwd},SYSDATE,0
		     )
		     <!-- #{name}  vo.getName() -->
		  </insert>
		  
		  Controller - Model - DAO - Model - JSP
    */
   public static void boardInsert(BoardVO vo)
   {
	   SqlSession session=ssf.openSession();//autocommit
	   // commit이 없다 
	   session.insert("boardInsert",vo);
	   session.commit(); // update,insert,delete
	   // 데이터가 갱신 
	   session.close();
   }
}
