package com.sist.dao;
// DBCP(web) / JDBC 
import java.util.*;

import com.sist.vo.BoardVO;

import java.sql.*;
/*
 *                자바
 *                 |
 *      |브라우저(HTML)연동   |오라클 연동
 *    브라우저   <=======>  오라클 (게시판데이터)
 *               연결
 *       |
 *  HTML/CSS/JavaScript   : 화면 UI    
 *  
 *  자바 => 데이터베이스 연결 : DAO
 *      => 브라우저 연동 => HTML전송 => Model
 *      
 *  => 데이터베이스 관리 / 사용자 요청에 대한 처리 
 *  
 *  => 자바 / 파이썬 
 *      |     | 장고 => 분석한 그래프
 *     스프링(JSP) => 
 */
// *** 2차 자바 / *** 3차 자바
public class BoardDAO {
   private Connection conn;
   private PreparedStatement ps;
   private final String URL="jdbc:oracle:thin:@localhost:1521:XE";
   private static BoardDAO dao;
   // 드라이버 등록 
   public BoardDAO()
   {
	   try
	   {
		   Class.forName("oracle.jdbc.driver.OracleDriver");
	   }catch(Exception ex) {}
   }
   // 싱글턴 static => 메모리 공간을 한개만 생성 
   //      => 오라클 데이터 => 한개를 생성 => 공유 
   public static BoardDAO newInstance()
   {
	   if(dao==null)
		   dao=new BoardDAO();
	   return dao;
   }
   // 오라클 연결 
   public void getConnection()
   {
	   try
	   {
		   conn=DriverManager.getConnection(URL,"hr","happy");
	   }catch(Exception ex) {}
   }
   // 오라클 닫기 
   public void disConnection()
   {
	   try
	   {
		   if(ps!=null) ps.close();
		   if(conn!=null) conn.close();
	   }catch(Exception ex) {}
   }
   // 기능 
   // 1. 목록 => 리턴형 (요청 처리 결과) , 매개변수 (사용자가 보내준 값)
   public List<BoardVO> boardListData(int page)
   {
	   List<BoardVO> list=
			   new ArrayList<BoardVO>();
	   // sql.* => 컴파일 예외처리 => CheckExcepion
	   try
	   {
		   // 1. 연결 
		   getConnection(); // conn hr/happy
		   // 2. SQL => 페이지 나누기 (인라인뷰)
		   String sql="SELECT no,subject,name,TO_CHAR(regdate,'YYYY-MM-DD'),hit,num "
				     +"FROM (SELECT no,subject,name,regdate,hit,rownum as num "
				     +"FROM (SELECT no,subject,name,regdate,hit "
				     +"FROM htmlboard ORDER BY no DESC)) "
				     +"WHERE num BETWEEN ? AND ?";
		   ps=conn.prepareStatement(sql); // 오라클로 SQL문장 전송
		   int rowSize=10;
		   int start=(rowSize*page)-(rowSize-1);
		   // 1 11 21
		   int end=rowSize*page;
		   // 10 20 30..
		   ps.setInt(1, start);
		   ps.setInt(2, end);
		   // 실행 명령 
		   ResultSet rs=ps.executeQuery();
		   while(rs.next())
		   {
			  BoardVO vo=new BoardVO();
			  vo.setNo(rs.getInt(1));
			  vo.setSubject(rs.getString(2));
			  vo.setName(rs.getString(3));
			  vo.setDbday(rs.getString(4));
			  vo.setHit(rs.getInt(5));
			  list.add(vo);
		   }
		   rs.close();
	   }catch(Exception ex)
	   {
		   // 복구가 어렵다 => 예외에 대한 정보확인 
		   ex.printStackTrace();
	   }
	   finally
	   {
		   // 무조건 수행 
		   disConnection();
	   }
	   return list;
   }
   // 1-1. 총페이지 
   // int total=mybatis.selectOne("sql")
   // int total=jpa.count()
   public int boardTotalPage()
   {
	   int total=0;
	   try
	   {
		   getConnection();
		   String sql="SELECT CEIL(COUNT(*)/10.0) FROM htmlboard";
		   // 11/10.0 => 1.1 => 올림 => 2
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
   // 2. 상세보기  ----------- SELECT
   // 3. 글쓰기  INSERT
   // => 웹 프로그램 (감) => 화면 이동 => 어떤 데이터가 필요한지..
   public void boardInsert(BoardVO vo)
   {
	   try
	   {
		   getConnection();
		   String sql="INSERT INTO htmlboard(no,name,subject,content,pwd) "
				     +"VALUES(hb_no_seq.nextval,?,?,?,?)";
		   ps=conn.prepareStatement(sql);
		   // ?에 값을 채워서 실행
		   ps.setString(1, vo.getName());
		   ps.setString(2, vo.getSubject());
		   ps.setString(3, vo.getContent());
		   ps.setString(4, vo.getPwd());
		   
		   // 실행 
		   ps.executeUpdate(); // commit이 포함 
		   
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   disConnection();
	   }
   }
   // 4. 수정    UPDATE
   // 5. 삭제    DELETE
   // => 자료실 => 댓글 => 예약 => 결제 => 장바구니 => 추천 
}



