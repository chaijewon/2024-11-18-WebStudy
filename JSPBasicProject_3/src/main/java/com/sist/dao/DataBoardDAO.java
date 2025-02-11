package com.sist.dao;
import java.util.*;
import java.sql.*;
// DBCP => 웹 프로그램의 일반화 => MyBatis 
public class DataBoardDAO {
	   private Connection conn;
	   private PreparedStatement ps;
	   private final String URL="jdbc:oracle:thin:@localhost:1521:XE";
	   private static DataBoardDAO dao;
	   
	   // 드라이버 등록  => 톰캣 
	   public DataBoardDAO()
	   {
		   try
		   {
			   Class.forName("oracle.jdbc.driver.OracleDriver");
		   }catch(Exception ex) {}
	   }
	   // 싱글턴
	   public static DataBoardDAO newInstance()
	   {
		   if(dao==null)
			   dao=new DataBoardDAO();
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
	   // 목록 + 총페이지
	   // 상세보기 => 다운로드 
	   // 추가 => 업로드 
	   // 수정 
	   // 삭제 => 댓글 먼저 삭제 => 게시물 
}
