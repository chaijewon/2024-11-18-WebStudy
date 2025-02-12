package com.sist.dao;
import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import java.sql.*;
/*
 *   JSP 기초 
 *   JSPFront : bootstrap / 자바스크립트 (jquery) 
 *   JSP middle => <incude> => MVC / JSTL,EL
 *                            -----
 */
public class EmpDAO {
   private Connection conn;
   private PreparedStatement ps;
   //private final String URL="jdbc:oracle:thin:@localhost:1521:XE";
   private static EmpDAO dao;
   
   // 드라이버 등록  => 톰캣 
	/*
	 * public EmpDAO() { try { Class.forName("oracle.jdbc.driver.OracleDriver");
	 * }catch(Exception ex) {} }
	 */
   // 싱글턴
   public static EmpDAO newInstance()
   {
	   if(dao==null)
		   dao=new EmpDAO();
	   return dao;
   }
   // 연결 ==> 미리 생성한 Connection의 주소 읽기 
   public void getConnection()
   {
	   try
	   {
			/* conn=DriverManager.getConnection(URL,"hr","happy"); */
		   Context init=new InitialContext();
		   Context c=(Context)init.lookup("java://comp/env");
		   DataSource ds=(DataSource)c.lookup("jdbc/oracle");
		   conn=ds.getConnection();
	   }catch(Exception ex) {}
   }
   // 닫기 ==> 재사용 반환 
   public void disConnection()
   {
	   try
	   {
		   if(ps!=null) ps.close();
		   if(conn!=null) conn.close();
	   }catch(Exception ex) {}
   }
   // JDBC => DBCP => ORM(MyBatis,JPA)
   // 기능 처리 
   public List<EmpVO> empListData()
   {
	   List<EmpVO> list=
			   new ArrayList<EmpVO>();
	   try
	   {
		   getConnection();
		   String sql="SELECT empno,ename,job,hiredate,sal "
				     +"FROM emp ORDER BY empno ASC";
		   ps=conn.prepareStatement(sql); // 오라클 전송 
		   ResultSet rs=ps.executeQuery();
		   // 실행 결과값 받기 
		   while(rs.next())
		   {
			   EmpVO vo=new EmpVO();
			   vo.setEmpno(rs.getInt(1));
			   vo.setEname(rs.getString(2));
			   vo.setJob(rs.getString(3));
			   vo.setHiredate(rs.getDate(4));
			   vo.setSal(rs.getInt(5));
			   
			   list.add(vo);
		   }
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   disConnection();
	   }
	   return list;
   }
   public List<FoodVO> foodListData()
   {
	   List<FoodVO> list=
			   new ArrayList<FoodVO>();
	   try
	   {
		   getConnection();
		   String sql="SELECT fno,name,poster,type,rownum "
				     +"FROM food_menupan "
				     +"WHERE rownum<=30";
		   ps=conn.prepareStatement(sql);
		   ResultSet rs=ps.executeQuery();
		   while(rs.next())
		   {
			   FoodVO vo=new FoodVO();
			   vo.setFno(rs.getInt(1));
			   vo.setName(rs.getString(2));
			   vo.setPoster("https://www.menupan.com"+rs.getString(3));
			   vo.setType(rs.getString(4));
			   list.add(vo);
		   }
		   rs.close();
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   disConnection();
	   }
	   return list;
   }
}





