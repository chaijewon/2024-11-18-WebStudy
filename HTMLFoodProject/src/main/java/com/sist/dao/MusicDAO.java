package com.sist.dao;
import java.util.*;
import java.sql.*;
import com.sist.vo.*;
public class MusicDAO {
  // 연결 => 오라클 
  private Connection conn;
  // SQL=> 송신 , 결과값 => 수신 
  private PreparedStatement ps;
  // 연결 => URL 
  private final String URL="jdbc:oracle:thin:@localhost:1521:XE";
  // 한사람당 한개의 DAO사용 => 싱글턴 
  private static MusicDAO dao;
  
  // 1. 드라이버 등록 
  public MusicDAO()
  {
	  try
	  {
		  Class.forName("oracle.jdbc.driver.OracleDriver");
	  }catch(Exception ex) {}
  }
  // 2. 싱글턴 => static으로 설정 (static 메모리 공간이 한개)
  public static MusicDAO newInstance()
  {
	  if(dao==null)
		  dao=new MusicDAO();
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
  
  // 목록 출력 => FoodVO (맛집 한개에 대한 모든 정보)
  public List<MusicVO> musicListData(int page)
  {
	  List<MusicVO> list=
			  new ArrayList<MusicVO>();
	  try
	  {
		  //1. 연결
		  getConnection();
		  //2. SQL문장 전송 
		  String sql="SELECT mno,title,poster,num "
				   +"FROM (SELECT mno,title,poster,rownum as num "
				   +"FROM (SELECT /*+ INDEX_ASC(genie_music gm_mno_pk)*/mno,title,poster "
				   +"FROM genie_music)) "
				   +"WHERE num BETWEEN ? AND ?";
		  //3. 오라클로 전송 
		  ps=conn.prepareStatement(sql);
		  //4. ?에 값을 채운다 
		  int rowSize=12;
		  int start=(rowSize*page)-(rowSize-1);
		  int end=rowSize*page;
		  ps.setInt(1, start);
		  ps.setInt(2, end);
		  // rownum은 1번부터 시작한다
		  // 자바 => 0 , 오라클 => 1
		  /*
		   *    'Hello Oracle'
		   *     123456....
		   */
		  //5. 실행 결과 읽기 
		  ResultSet rs=ps.executeQuery();
		  // => list에 저장 
		  while(rs.next())
		  {
			  MusicVO vo=new MusicVO();
			  vo.setMno(rs.getInt(1));
			  vo.setTitle(rs.getString(2));
			  vo.setPoster(rs.getString(3));
			  list.add(vo);
		  }
		  rs.close();
	  }catch(Exception ex)
	  {
		  // 오류 처리 
		  ex.printStackTrace();
	  }
	  finally
	  {
		  // 닫기
		  disConnection();
	  }
	  return list;
  }
  // 총페이지 
  // 시행착오 
  public int musicTotalPage()
  {
	  int total=0;
	  try
	  {
		  getConnection();
		  String sql="SELECT CEIL(COUNT(*)/12.0) "
				    +"FROM genie_music";
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
  public List<MusicVO> musicGenreFind(int page,int cno)
  {
	  List<MusicVO> list=
			  new ArrayList<MusicVO>();
	  try
	  {
		  //1. 연결
		  getConnection();
		  //2. SQL문장 전송 
		  String sql="SELECT mno,title,poster,num "
				   +"FROM (SELECT mno,title,poster,rownum as num "
				   +"FROM (SELECT /*+ INDEX_ASC(genie_music gm_mno_pk)*/mno,title,poster "
				   +"FROM genie_music WHERE cno=?)) "
				   +"WHERE num BETWEEN ? AND ?";
		  //3. 오라클로 전송 
		  ps=conn.prepareStatement(sql);
		  //4. ?에 값을 채운다 
		  int rowSize=12;
		  int start=(rowSize*page)-(rowSize-1);
		  int end=rowSize*page;
		  ps.setInt(1, cno);
		  ps.setInt(2, start);
		  ps.setInt(3, end);
		  // rownum은 1번부터 시작한다
		  // 자바 => 0 , 오라클 => 1
		  /*
		   *    'Hello Oracle'
		   *     123456....
		   */
		  //5. 실행 결과 읽기 
		  ResultSet rs=ps.executeQuery();
		  // => list에 저장 
		  while(rs.next())
		  {
			  MusicVO vo=new MusicVO();
			  vo.setMno(rs.getInt(1));
			  vo.setTitle(rs.getString(2));
			  vo.setPoster(rs.getString(3));
			  list.add(vo);
		  }
		  rs.close();
	  }catch(Exception ex)
	  {
		  // 오류 처리 
		  ex.printStackTrace();
	  }
	  finally
	  {
		  // 닫기
		  disConnection();
	  }
	  return list;
  }
  public int musicGenreTotalPage(int cno)
  {
	  int total=0;
	  try
	  {
		  getConnection();
		  String sql="SELECT CEIL(COUNT(*)/12.0) "
				    +"FROM genie_music "
				    +"WHERE cno="+cno;
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
  // 상세보기 
  
}
