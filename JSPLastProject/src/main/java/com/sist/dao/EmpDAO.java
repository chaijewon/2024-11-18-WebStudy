package com.sist.dao;
import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.commons.*;
import com.sist.vo.*;
/*
 *   프로시저 / 트리거 
 *   EC2
 */
public class EmpDAO {
   private static SqlSessionFactory ssf;
   static
   {
	   ssf=CreateSqlSessionFactory.getSsf();
   }
   
   /*
    *    <select id="empGetEnameData" resultType="EmpVO">
		    SELECT empno,ename 
		    FROM emp
		 </select>
    */
   public static List<EmpVO> empGetEnameData()
   {
	   SqlSession session=ssf.openSession();
	   List<EmpVO> list=session.selectList("empGetEnameData");
	   session.close();
	   return list;
   }
   /*
    *   <select id="empFindData" resultType="EmpVO" parameterType="hashmap">
		   SELECT empno,ename,job,sal,TO_CHAR(hiredate,'YYYY-MM-DD') as dbday
		   FROM emp
		   <trim prefix="WHERE empno IN(" suffix=")" suffixOverrides=")" prefixOverrides="(">
		    <foreach collection="empnos" item="empno" open="(" close=")" separator=",">#{empno}</foreach>
		   </trim>
		  </select>
    */
   public static List<EmpVO> empFindData(Map map)
   {
	   SqlSession session=ssf.openSession();
	   List<EmpVO> list=session.selectList("empFindData",map);
	   session.close();
	   return list;
   }
   
   
}
