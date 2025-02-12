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
	   // JDBC => DBCP => MyBatis(XML(JSP),Annotataion(Spring)) => JPA
	   /*
	    *   과정 
	    *   JSP활용 => 18일 
	    *   --------------
	    *   Spring : MVC => SpringFramework 직접 개발 
	    */
	   // 목록 + 총페이지
	   public List<DataBoardVO> databoardListData(int page)
	   {
		   List<DataBoardVO> list=
				   new ArrayList<DataBoardVO>();
		   // nodejs + typescript
		   // 설치 / 개념 => 소스
		   // 실행
		   try
		   {
			   getConnection();
			   String sql="SELECT no,subject,name,regdate,hit,num "
					    +"FROM (SELECT no,subject,name,regdate,hit,rownum as num "
					    +"FROM (SELECT no,subject,name,regdate,hit "
					    +"FROM jspDataBoard ORDER BY no DESC)) "
					    +"WHERE num BETWEEN ? AND ?";
			   ps=conn.prepareStatement(sql);
			   ps.setInt(1, (page*10)-9);
			   ps.setInt(2, page*10);
			   ResultSet rs=ps.executeQuery();
			   while(rs.next())
			   {
				   DataBoardVO vo=new DataBoardVO();
				   vo.setNo(rs.getInt(1));
				   vo.setSubject(rs.getString(2));
				   vo.setName(rs.getString(3));
				   vo.setRegdate(rs.getDate(4));
				   vo.setHit(rs.getInt(5));
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
	   public int databoardTotalPage()
	   {
		   int total=0;
		   try
		   {
			   getConnection();
			   String sql="SELECT CEIL(COUNT(*)/10.0) "
					     +"FROM jspDataBoard";
			   ps=conn.prepareStatement(sql);
			   ResultSet rs=ps.executeQuery();
			   rs.next();
			   total=rs.getInt(1);
			   rs.close();
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   finally
		   {
			   disConnection();
		   }
		   return total;
	   }
	   // 상세보기 => 다운로드 
	   // 추가 => 업로드
	   public void databoardInsert(DataBoardVO vo)
	   {
		   try
		   {
			   getConnection();
			   String sql="INSERT INTO jspDataboard VALUES("
					     +"jdb_no_seq.nextval,?,?,?,?,SYSDATE,0,?,?)";
			   ps=conn.prepareStatement(sql);
			   ps.setString(1, vo.getName());
			   ps.setString(2, vo.getSubject());
			   ps.setString(3, vo.getContent());
			   ps.setString(4, vo.getPwd());
			   ps.setString(5, vo.getFilename());
			   ps.setInt(6, vo.getFilesize());
			   ps.executeUpdate();
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   finally
		   {
			   disConnection();
		   }
	   }
	   // 수정 
	   // 삭제 => 댓글 먼저 삭제 => 게시물 
}

