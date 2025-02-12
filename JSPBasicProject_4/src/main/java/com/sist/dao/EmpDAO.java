package com.sist.dao;
import java.util.*;
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
   private final String URL="jdbc:oracle:thin:@localhost:1521:XE";
   private static EmpDAO dao;
   public static void main(String[] args) {
	  try
	  {
		  //Class clsName=Class.forName("com.sist.dao.EmpDAO");
		  //Object obj=clsName.newInstance();
		  //clsName.getDeclaredConstructor().newInstance();
	  }catch(Exception ex) {}
   }
   // 드라이버 등록  => 톰캣 
   public EmpDAO()
   {
	   try
	   {
		   Class.forName("oracle.jdbc.driver.OracleDriver");
	   }catch(Exception ex) {}
   }
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
		   conn=DriverManager.getConnection(URL,"hr","happy");
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
  
}





