package com.sist.dao;
import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.vo.*;
import com.sist.commons.*;
public class FoodDAO {
  private static SqlSessionFactory ssf;
  static
  {
	  ssf=CreateSqlSessionFactory.getSsf();
  }
  
  /*
   *       <select id="foodMainHouseData" resultType="FoodVO">
		    SELECT * FROM (SELECT * FROM project_food 
		      ORDER BY DBMS_RANDOM.RANDOM
		    )
		    WHERE rownum&lt;=1
		  </select>
		  <select id="foodMainHouseData8" resultType="FoodVO">
		    SELECT * FROM (SELECT * FROM project_food 
		      ORDER BY DBMS_RANDOM.RANDOM
		    )
		    WHERE rownum&lt;=8
		  </select>
   */
  public static FoodVO foodMainHouseData()
  {
	  SqlSession session=ssf.openSession();
	  FoodVO vo=session.selectOne("foodMainHouseData");
	  session.close();
	  return vo;
  }
  
  public static List<FoodVO> foodMainHouseData8()
  {
	  SqlSession session=ssf.openSession();
	  List<FoodVO> list=session.selectList("foodMainHouseData8");
	  session.close();
	  return list;
  }
  
}
