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
	   SqlSession session=null;
	   List<FoodVO> list=null;
	   try
	   {
		   session=ssf.openSession();
		   list=session.selectList("foodTop12",column);
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   if(session!=null)
			   session.close();
	   }
	   return list;
   }
   /*
    *   <select id="foodListData" resultType="FoodVO" 
          parameterType="hashmap">
		  SELECT fno,poster,name,num
		  FROM (SELECT fno,poster,name,rownum as num 
		  FROM (SELECT /+ INDEX_ASC(food_menupan fm_fno_pk)/fno,poster,name 
		  FROM food_menupan))
		  WHERE num BETWEEN #{start} AND #{end}
		  </select>
    */
   public static List<FoodVO> foodListData(Map map)
   {
	   SqlSession session=null;
	   List<FoodVO> list=null;
	   try
	   {
		   session=ssf.openSession();
		   list=session.selectList("foodListData",map);
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   if(session!=null)
			   session.close();
	   }
	   return list;
   }
   /*
    * <select id="foodTotalPage" resultType="int">
       SELECT CEIL(COUNT(*)/20.0) FROM food_menupan
      </select>
    */
   public static int foodTotalPage()
   {
	   SqlSession session=ssf.openSession();
	   int total=session.selectOne("foodTotalPage");
	   session.close();
	   return total;
   }
   /*
    *   <update id="hitIncrement" parameterType="int">
		    UPDATE food_menupan SET
		    hit=hit+1
		    WHERE fno=#{fno}
		  </update>
		  <select id="foodDetailData" resultType="FoodVO"
		  parameterType="int">
		   SELECT * FROM food_menupan
		   WHERE fno=#{fno}
		  </select>
    */
   public static FoodVO foodDetailData(int fno)
   {
	   SqlSession session=ssf.openSession();
	   session.update("hitIncrement",fno);
	   session.commit();
	   FoodVO vo=session.selectOne("foodDetailData",fno);
	   session.close();
	   return vo;
   }
   
   // emp
   public static List<EmpVO> empListData()
   {
	   SqlSession session=ssf.openSession();
	   List<EmpVO> list=session.selectList("empListData");
	   session.close();
	   return list;
   }
}
