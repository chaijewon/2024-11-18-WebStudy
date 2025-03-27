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
   /*
    *    DayVO
    *     => List<TimeVO> tList
    *     
    *    <select id="reserveDayTimeInfoData" resultType="string"
		   parameterType="int"
		 >
		   SELECT time FROM reserve_day
		   WHERE rno=#{rno};
		 </select>
		 <select id="reserveGetTimeData" resultType="string"
		   parameterType="int"
		 >
		   SELECT time FROM reserve_time
		   WHERE tno=#{tno}
		 </select>
    */
   public static String reserveDayTimeInfoData(int rno)
   {
	   String times="";
	   SqlSession session=ssf.openSession();
	   try
	   {
	    times=session.selectOne("reserveDayTimeInfoData",rno);
	    System.out.println(times);
	   }catch(Exception ex)
	   {
		  ex.printStackTrace();  
	   }
	   session.close();
	   return times;
   }
   public static String reserveGetTimeData(int tno)
   {
	   SqlSession session=ssf.openSession();
	   String times=session.selectOne("reserveGetTimeData",tno);
	   session.close();
	   return times;
   }
   /*
    *   <insert id="reserveInsert" parameterType="ReserveVO">
		  INSERT INTO reserve_info VALUES(
		    (SELECT NVL(MAX(rno)+1,1) FROM reserve_info),
		    #{id},#{fno},#{day},#{time},#{inwon},
		    SYSDATE,'n'
		  )
		 </insert>
    */
   public static void reserveInsert(ReserveVO vo)
   {
	   SqlSession session=ssf.openSession(true);
	   session.insert("reserveInsert",vo);
	   session.close();
   }
   
   /*
    *   <select id="reserveMyPageData" resultMap="reserveMap" parameterType="string">
		   SELECT rno,ri.fno,day,ri.time,inwon,isok,name,poster,address,phone,
		   TO_CHAR(regdate,'YYYY-MM-DD') as dbday
		   FROM reserve_info ri , project_food pf
		   WHERE ri.fno=pf.fno
		   AND id=#{id}
		   ORDER BY rno DESC
		 </select>
		 <!-- admin 출력 목록 -->
		 <select id="reserveAdminPageData" resultMap="reserveMap" parameterType="string">
		   SELECT rno,ri.fno,day,ri.time,inwon,isok,name,poster,address,phone,
		   TO_CHAR(regdate,'YYYY-MM-DD') as dbday
		   FROM reserve_info ri , project_food pf
		   WHERE ri.fno=pf.fno
		   ORDER BY rno DESC
		 </select>
		 
		 => DAO => 데이터 관리 (요청)
		 => Model => 요청한 데이터 전송 
		 => View (JSP) => 화면 출력 
		    ---------- 사용자 요청 (Front) => 자바스크립트
		    
		 JSP => .do => Model <=> DAO
		                 | request
		                JSP
		 처리 => 메소드 
		         | 호출 => 어노테이션 => 스프링 / 스프링부트
		         
		 
    */
   public static List<ReserveVO> reserveMyPageData(String id)
   {
	   SqlSession session=ssf.openSession();
	   List<ReserveVO> list=session.selectList("reserveMyPageData",id);
	   session.close();
	   return list;
   }
   
   public static List<ReserveVO> reserveAdminPageData()
   {
	   SqlSession session=ssf.openSession();
	   List<ReserveVO> list=session.selectList("reserveAdminPageData");
	   session.close();
	   return list;
   }
   
   /*
    *   <update id="reserveAdminOk" parameterType="int">
		   UPDATE reserve_info SET
		   isok='y'
		   WHERE rno=#{rno}
		 </update>
		 
		 <delete id="reserveMyPageCancel" parameterType="int">
		   DELETE FROM reserve_info
		   WHERE rno=#{rno}
		 </delete>
    */
   public static void reserveAdminOk(int rno)
   {
	   SqlSession session=ssf.openSession(true);
	   session.update("reserveAdminOk",rno);
	   session.close();
   }
   
   public static void reserveMyPageCancel(int rno)
   {
	   SqlSession session=ssf.openSession(true);
	   session.delete("reserveMyPageCancel",rno);
	   session.close();
   }
   
   /*
    *   <select id="reserveMypageInfoData" resultMap="reserveMap" parameterType="int">
		   SELECT rno,day,time,inwon,TO_CHAR(regdate,'YYYY-MM-DD HH24:MI:SS') as dbday,
		          name,poster,address,phone,score,content,theme
		   FROM reserve_info ri , project_food pf
		   WHERE ri.fno=pf.fno
		   AND rno=#{rno} => ?
		 </select>
    */
   public static ReserveVO reserveMypageInfoData(int rno)
   {
	   SqlSession session=ssf.openSession();
	   ReserveVO vo=session.selectOne("reserveMypageInfoData",rno);
	   session.close();
	   return vo;
   }
   
}
