package com.sist.dao;
/*
 *    Servlet / JSP 
 *    -------   ---
 *              | HTML화면 (View) 
 *     | 보안이 뛰어나다 => 배포 (.class)
 *       => 로직 , 보안 => 연결용 , 라이브러리 => HTML을 출력하지 않는다
 *                              ======== 스프링
 *     | HTML구현	부분이 어렵다 
 *     | HTML을 약간 수정시마다 => 컴파일 / 실행 
 *    ----------------------------------------------
 *     JSP 
 *      => 자바 + HTML : 구분이 어렵다 
 *         ----------
 *          자바 ---(Model)
 *                | ----- 서블릿(Controller) => MVC (*****)
 *          HTML---(View)
 *          ** Spring은 MVC구조만 사용이 가능 
 *          ** URL => 확장자 => .jsp (Model 1) => 재사용이 없다
 *             ------------- 사용자 .do / .naver
 *             
 *      => 1. SQL문장이 없다 (JPA)
 *      => 2. HTML에 제어문이 가능 (JSP가 필요 없다) 
 *            Vue/React/ThymeLeaf
 *      => Front / Back => MSA 
 *          
 *          
 */
import java.util.*;
import java.sql.*;
import com.sist.vo.*;
public class ReplyDAO {
	// 연결 => 오라클 
	  private Connection conn;
	  // SQL=> 송신 , 결과값 => 수신 
	  private PreparedStatement ps;
	  // 연결 => URL 
	  private final String URL="jdbc:oracle:thin:@localhost:1521:XE";
	  // 한사람당 한개의 DAO사용 => 싱글턴 
	  private static ReplyDAO dao;
	  
	  // 1. 드라이버 등록 
	  public ReplyDAO()
	  {
		  try
		  {
			  Class.forName("oracle.jdbc.driver.OracleDriver");
		  }catch(Exception ex) {}
	  }
	  // 2. 싱글턴 => static으로 설정 (static 메모리 공간이 한개)
	  public static ReplyDAO newInstance()
	  {
		  if(dao==null)
			  dao=new ReplyDAO();
		  return dao;
	  }
	  // 3. 오라클 연결 
	  public void getConnection()
	  {
		  try
		  {
			  conn=DriverManager.getConnection(URL,"hr","happy");
			  // conn hr/happy
		  }catch(Exception ex) {}
	  }
	  // 4. 오라클 닫기 
	  public void disConnection()
	  {
		  try
		  {
			  if(ps!=null) ps.close();
			  if(conn!=null) conn.close();
		  }catch(Exception ex) {}
	  }
	  
	  // 기능 
	  // DML => SELECT / UPDATE / DELETE / INSERT
	  public void replyInsert(ReplyVO vo)
	  {
		  try
		  {
			  getConnection();
			  String sql="INSERT INTO reply VALUES("
					    +"reply_rno_seq.nextval,?,?,?,?,SYSDATE)";
			  ps=conn.prepareStatement(sql);
			  ps.setInt(1,vo.getFno());
			  ps.setString(2, vo.getId());
			  ps.setString(3, vo.getName());
			  ps.setString(4, vo.getMsg());
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
	  public List<ReplyVO> replyListData(int fno)
	  {
		  List<ReplyVO> list=
				  new ArrayList<ReplyVO>();
		  try
		  {
			  getConnection();
			  String sql="SELECT rno,fno,id,name,msg,"
					    +"TO_CHAR(regdate,'YYYY-MM-DD HH24:MI:SS') "
					    +"FROM reply "
					    +"WHERE fno="+fno
					    +" ORDER BY rno DESC";
			  ps=conn.prepareStatement(sql);
			  ResultSet rs=ps.executeQuery();
			  while(rs.next())
			  {
				  ReplyVO vo=new ReplyVO();
				  vo.setRno(rs.getInt(1));
				  vo.setFno(rs.getInt(2));
				  vo.setId(rs.getString(3));
				  vo.setName(rs.getString(4));
				  vo.setMsg(rs.getString(5));
				  vo.setDbday(rs.getString(6));
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
	  public void replyDelete(int rno)
	  {
		  try
		  {
			  getConnection();
			  String sql="DELETE FROM reply "
					    +"WHERE rno="+rno;
			  ps=conn.prepareStatement(sql);
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
	  public void replyUpdate(int rno,String msg)
	  {
		  try
		  {
			  getConnection();
			  String sql="UPDATE reply SET "
					    +"msg=? "
					    +"WHERE rno=?";
			  ps=conn.prepareStatement(sql);
			  ps.setString(1, msg);
			  ps.setInt(2, rno);
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
}





