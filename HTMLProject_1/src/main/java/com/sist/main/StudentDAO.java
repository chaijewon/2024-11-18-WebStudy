package com.sist.main;
import java.util.*;

import oracle.jdbc.OracleTypes;

import java.sql.*;
public class StudentDAO {
   private Connection conn;
   private CallableStatement cs;
   // Procedure호출시에 사용 
   private final String URL="jdbc:oracle:thin:@localhost:1521:XE";
   private static StudentDAO dao;
   // 5장 오라클 연동 프로그램 
   public StudentDAO()
   {
	   try
	   {
		   Class.forName("oracle.jdbc.driver.OracleDriver");
	   }catch(Exception ex) {}
   }
   public static StudentDAO newInstance()
   {
	   if(dao==null)
		   dao=new StudentDAO();
	   return dao;
   }
   public void getConnection()
   {
	   try
	   {
		   conn=DriverManager.getConnection(URL,"hr","happy");
	   }catch(Exception ex) {}
   }
   public void disConnection()
   {
	   try
	   {
		   if(cs!=null) cs.close();
		   if(conn!=null) conn.close();
	   }catch(Exception ex) {}
   }
   // 기능 
   /*
    *   CREATE OR REPLACE PROCEDURE studentAllData(
		   pResult OUT SYS_REFCURSOR
		)
		IS
		BEGIN
		   OPEN pResult FOR
		     SELECT * FROM student;
		END;
		/

    */
   // 1. 목록 출력 
   public List<StudentVO> studentAllData()
   {
	   List<StudentVO> list=
			   new ArrayList<StudentVO>();
	   try
	   {
		   getConnection();
		   String sql="{CALL studentAllData(?)}";
		   cs=conn.prepareCall(sql);// 전송 
		   // ?에 값을 채운다 
		   // OUT변수일때 사용 
		   cs.registerOutParameter(1, OracleTypes.CURSOR);
		   // INTEGER (정수) , VARCHAR , CURSOR 
		   // 실행 요청 
		   cs.executeQuery(); // 모든 실행 INSERT/UPDATE/DELETE
		   // 실행 
		   // CURSOR => ResultSet 
		   // MyBatis => Map
		   ResultSet rs=(ResultSet)cs.getObject(1);
		   while(rs.next())
		   {
			   StudentVO vo=new StudentVO();
			   vo.setHakbun(rs.getInt(1));
			   vo.setName(rs.getString(2));
			   vo.setKor(rs.getInt(3));
			   vo.setEng(rs.getInt(4));
			   vo.setMath(rs.getInt(5));
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
   // 2. 등록 
   
   // 3. 수정 
   // 4. 삭제
   // 5. 상세보기 
   /*
    *   CREATE OR REPLACE PROCEDURE studentDetailData(
		    pHakbun IN student.hakbun%TYPE,
		    pResult OUT SYS_REFCURSOR
		)
		IS
		BEGIN 
		  OPEN pResult FOR
		   SELECT * 
		   FROM student
		   WHERE hakbun=pHakbun;
		END;

    */
   public StudentVO studentDetailData(int hakbun)
   {
	   StudentVO vo=new StudentVO();
	   try
	   {
		   getConnection();
		   String sql="{CALL studentDetailData(?,?)}";
		   cs=conn.prepareCall(sql);
		   // ?에 값을 채운다 
		   // in변수는 동일 
		   cs.setInt(1, hakbun);
		   cs.registerOutParameter(2, OracleTypes.CURSOR);
		   // 실행 
		   cs.executeQuery();
		   // 결과값 받기 
		   ResultSet rs=(ResultSet)cs.getObject(2);
		   rs.next();
		   vo.setHakbun(rs.getInt(1));
		   vo.setName(rs.getString(2));
		   vo.setKor(rs.getInt(3));
		   vo.setEng(rs.getInt(4));
		   vo.setMath(rs.getInt(5));
		   rs.close();
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   disConnection();
	   }
	   return vo;
   }
}
