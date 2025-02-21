package com.sist.dao;
import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import java.io.*;
import com.sist.vo.*;
public class FoodDAO {
   private static SqlSessionFactory ssf;
   static
   {
	   ssf=CreateSqlSessionFactory.getSsf();
   }
   
   /*
    *   <select id="foodTop12" resultType="FoodVO" parameterType="string">
		    SELECT fno,poster,name,rownum
		    FROM (SELECT fno,poster,name 
		    FROM food_menupan ORDER BY ${column} DESC)
		    WHERE rownum&lt;=12
		  </select>
    */
   public static List<FoodVO> foodTop12(String column)
   {
	   SqlSession session=ssf.openSession();
	   // conn/ps 
	   List<FoodVO> list=session.selectList("foodTop12",column);
	   
	   session.close();// 반환 (DBCP) => 재사용
	   
	   return list;
   }
}
