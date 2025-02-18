package com.sist.dao;
import java.util.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.*;

import java.io.*;
import com.sist.vo.*;
public class BoardDAO {
  private static SqlSessionFactory ssf;
  // XML의 데이터를 저장 => SqlSessionFactory
  static
  {
	  try
	  {
		  Reader reader=Resources.getResourceAsReader("Config.xml");
		  ssf=new SqlSessionFactoryBuilder().build(reader);
	  }catch(Exception ex)
	  {
		  System.out.println(ex.getMessage());
	  }
  }
  // 기능 설정
  /*
   *   <select id="boardListData" resultType="BoardVO" parameterType="string">
		    SELECT no,subject,name,regdate,hit,num
		    FROM (SELECT no,subject,name,regdate,hit,rownum as num 
		    FROM (SELECT no,subject,name,regdate,hit 
		    FROM board ORDER BY no DESC))
		    WHERE num BETWEEN #{start} AND #{end}
		  </select>
   */
  public static List<BoardVO> boardListData(Map map)
  {
	  SqlSession session=ssf.openSession();
	  List<BoardVO> list=session.selectList("boardListData",map);
	  session.close();// POOL로 반환
	  return list;
	  
  }
  /*
   *   <select id="boardTotalPage" resultType="int">
        SELECT CEIL(COUNT(*)/10.0) FROM board
       </select>
   */
  public static int boardTotalPage()
  {
	  SqlSession session=ssf.openSession();
	  int total=session.selectOne("boardTotalPage");
	  session.close();// POOL로 반환
	  return total;
	  
  }
  /*
   *   <insert id="boardInsert" parameterType="BoardVO">
		    <!-- MyBatis의 sequence: 자동 증가번호  -->
		    <selectKey keyProperty="no" resultType="int" order="BEFORE">
		     SELECT NVL(MAX(no)+1,1) as no FROM board
		    </selectKey>
		    INSERT INTO board VALUES(#{no},#{name},
		    #{subject},#{content},#{pwd},SYSDATE,0)
		  </insert>
   */
  public static void boardInsert(BoardVO vo)
  {
	  SqlSession session=ssf.openSession();
	  /*
	   *  ssf.openSession(); setAutoCommit(false)
	   *  ssf.openSession(true); setAutoCommit(true)
	   */
	  session.insert("boardInsert",vo);
	  session.commit();
	  session.close();
  }
  // insert/update/delete/select => 관리 => SqlSession
  // SqlSession은 SqlSessionFactory가 생성 
  // SqlSession  session = ssf.openSession() 
  // connction / preparedstatement => close() 반환 
}
