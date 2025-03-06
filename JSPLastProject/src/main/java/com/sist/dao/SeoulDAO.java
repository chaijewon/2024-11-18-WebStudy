package com.sist.dao;
import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.commons.*;
import com.sist.vo.*;
public class SeoulDAO {
  private static SqlSessionFactory ssf;
  static
  {
	  ssf=CreateSqlSessionFactory.getSsf();
  }
  /*
   *   <select id="seoulListData" resultType="SeoulVO" parameterType="hashmap">
		   SELECT no,title,poster,hit,likecount,replycount,num
		   FROM (SELECT no,title,poster,hit,likecount,replycount,rownum as num 
		   FROM (SELECT no,title,poster,hit,likecount,replycount
		   FROM ${table_name} ORDER BY no ASC))
		   WHERE num BETWEEN #{start} AND #{end}
		  </select>
		  <select id="seoulTotalPage" resultType="int" parameterType="hashmap">
		   SELECT CEIL(COUNT(*)/12.0) FROM ${table_name}
		  </select>
   */
  public static List<SeoulVO> seoulListData(Map map)
  {
	  SqlSession session=ssf.openSession();
	  List<SeoulVO> list=session.selectList("seoulListData",map);
	  session.close();
	  return  list;
  }
  
  public static int seoulTotalPage(Map map)
  {
	  SqlSession session=ssf.openSession();
	  int total=session.selectOne("seoulTotalPage",map);
	  session.close();
	  return  total;
  }
  
}
