package com.sist.dao;
import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.commons.*;
import com.sist.vo.*;
public class ReserveDAO {
   private static SqlSessionFactory ssf;
   static 
   {
	   try
	   {
		   ssf=CreateSqlSessionFactory.getSsf();
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
   }
   
   /*
    *   <select id="reserveFoodData" resultType="FoodVO" parameterType="hashmap">
		   SELECT fno,poster,name,rownum 
		   FROM (SELECT fno,poster,name 
		   FROM project_food ORDER BY hit DESC)
		   WHERE type LIKE '%'||#{type}||'%'
		   AND rownum&lt;=50
		 </select>
    */
   public static List<FoodVO> reserveFoodData(Map map)
   {
	   SqlSession session=ssf.openSession();
	   List<FoodVO> list=session.selectList("reserveFoodData",map);
	   session.close();
	   return list;
   }
}
