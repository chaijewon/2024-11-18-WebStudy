package com.sist.dao;
// 오라클 연동 
import java.util.*;
import java.sql.*;
import com.sist.vo.*;
public class FoodDAO {
  // 연결 => 오라클 
  private Connection conn;
  // SQL=> 송신 , 결과값 => 수신 
  private PreparedStatement ps;
  // 연결 => URL 
  private final String URL="jdbc:oracle:thin:@localhost:1521:XE";
  // 한사람당 한개의 DAO사용 => 싱글턴 
  private static FoodDAO dao;
  
  // 1. 드라이버 등록 
  public FoodDAO()
  {
	  try
	  {
		  Class.forName("oracle.jdbc.driver.OracleDriver");
	  }catch(Exception ex) {}
  }
  // 2. 싱글턴 => static으로 설정 (static 메모리 공간이 한개)
  public static FoodDAO newInstance()
  {
	  if(dao==null)
		  dao=new FoodDAO();
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
  public List<FoodVO> foodListData(int page)
  {
	  List<FoodVO> list=
			  new ArrayList<FoodVO>();
	  try
	  {
		  //1. 연결
		  getConnection();
		  //2. SQL문장 전송 
		  String sql="SELECT fno,name,poster,num "
				   +"FROM (SELECT fno,name,poster,rownum as num "
				   +"FROM (SELECT /*+ INDEX_ASC(food_menupan fm_fno_pk)*/fno,name,poster "
				   +"FROM food_menupan)) "
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
			  FoodVO vo=new FoodVO();
			  vo.setFno(rs.getInt(1));
			  vo.setName(rs.getString(2));
			  vo.setPoster("https://www.menupan.com"+rs.getString(3));
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
  public int foodTotalPage()
  {
	  int total=0;
	  try
	  {
		  getConnection();
		  String sql="SELECT CEIL(COUNT(*)/12.0) "
				    +"FROM food_menupan";
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
  public FoodVO foodDetailData(int fno)
  {
	  FoodVO vo=new FoodVO();
	  try
	  {
		  getConnection();
		  String sql="UPDATE food_menupan SET "
				    +"hit=hit+1 "
				    +"WHERE fno="+fno;
		  ps=conn.prepareStatement(sql);
		  ps.executeUpdate();
		  
		  // mainpage => 공동작업 
		  /*
		   *   private int fno,hit;
  private double score;
  private String name,type,phone,address,theme,poster,
          images,time,parking,content,price;
		   */
		  sql="SELECT name,type,phone,address,theme,poster,"
		     +"images,time,parking,content,price,score,hit "
		     +"FROM food_menupan "
		     +"WHERE fno="+fno;
		  ps=conn.prepareStatement(sql);
		  ResultSet rs=ps.executeQuery();
		  rs.next();
		  // MyBatis 
		  vo.setName(rs.getString("name"));
		  vo.setType(rs.getString("type"));
		  vo.setPhone(rs.getString("phone"));
		  vo.setAddress(rs.getString("address"));
		  vo.setTheme(rs.getString("theme"));
		  vo.setPoster("https://www.menupan.com"+rs.getString("poster"));
		  vo.setImages(rs.getString("images"));
		  vo.setTime(rs.getString("time"));
		  vo.setParking(rs.getString("parking"));
		  vo.setContent(rs.getString("content"));
		  vo.setPrice(rs.getString("price"));
		  vo.setScore(rs.getDouble("score"));
		  vo.setHit(rs.getInt("hit"));
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
  // cookie 데이터 
  public FoodVO foodCookieData(int fno)
  {
	  FoodVO vo=new FoodVO();
	  try
	  {
		  getConnection();
		  String sql="SELECT fno,name,poster "
				    +"FROM food_menupan "
				    +"WHERE fno="+fno;
		  ps=conn.prepareStatement(sql);
		  ResultSet rs=ps.executeQuery();
		  rs.next();
		  vo.setFno(rs.getInt(1));
		  vo.setName(rs.getString(2));
		  vo.setPoster("https://www.menupan.com"+rs.getString(3));
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
  // 음식 종류별 검색 
  public List<FoodVO> foodTypeFind(int page,String type)
  {
	  List<FoodVO> list=
			  new ArrayList<FoodVO>();
	  try
	  {
		  getConnection();
		  String sql="";
		  int rowSize=12;
		  int start=(rowSize*page)-(rowSize-1);
		  int end=rowSize*page;
		  if(!type.equals("기타"))
		  {
			  sql="SELECT fno,name,poster,num "
			     +"FROM (SELECT fno,name,poster,rownum as num "
				 +"FROM (SELECT fno,name,poster "
			     +"FROM food_menupan "
				 +"WHERE type LIKE '%'||?||'%')) "
			     +"WHERE num BETWEEN ? AND ?";
			  
			  ps=conn.prepareStatement(sql);
				//4. ?에 값을 채운다 
			  ps.setString(1, type);
		      ps.setInt(2, start);
			  ps.setInt(3, end);
		  }
		  else
		  {
			  sql="SELECT fno,name,poster,num "
				 +"FROM (SELECT fno,name,poster,rownum as num "
				 +"FROM (SELECT fno,name,poster "
				 +"FROM food_menupan "
				 +"WHERE NOT REGEXP_LIKE(type,'한식|양식|중식|일식|카페'))) "
				 +"WHERE num BETWEEN ? AND ?";
			  ps=conn.prepareStatement(sql);
				//4. ?에 값을 채운다 
		      ps.setInt(1, start);
			  ps.setInt(2, end);
		  }
		  
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
			  FoodVO vo=new FoodVO();
			  vo.setFno(rs.getInt(1));
			  vo.setName(rs.getString(2));
			  vo.setPoster("https://www.menupan.com"+rs.getString(3));
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
  public int foodTypeTotalPage(String type)
  {
	  int total=0;
	  try
	  {
		  getConnection();
		  String sql="";
		  if(!type.equals("기타"))
		  {
			 sql="SELECT CEIL(COUNT(*)/12.0) "
				+"FROM food_menupan "
			    +"WHERE type LIKE '%'||?||'%'";
			 ps=conn.prepareStatement(sql);
			 ps.setString(1, type);
		  }
		  else
		  {
			  sql="SELECT CEIL(COUNT(*)/12.0) "
				 +"FROM food_menupan "
				 +"WHERE NOT REGEXP_LIKE(type,'한식|양식|중식|일식|카페')";
			  // 다중 검색 => MyBatis (동적쿼리)
			  ps=conn.prepareStatement(sql);
		  }
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
  // ?page= &col= &fd=
  public List<FoodVO> foodFind(int page,String col,String fd)
  {
	  List<FoodVO> list=new ArrayList<FoodVO>();
	  try
	  {
		  getConnection();
		  String sql="SELECT fno,name,poster,address,type,num "
				    +"FROM (SELECT fno,name,poster,address,type,rownum as num "
				    +"FROM (SELECT fno,name,poster,address,type "
				    +"FROM food_menupan "
				    +"WHERE "+col+" LIKE '%'||?||'%')) "
				    +"WHERE num BETWEEN ? AND ?";
		  // setString(1,col) => col=address
		  // => WHERE 'address' 
		  ps=conn.prepareStatement(sql);
		  int rowSize=20;
		  int start=(rowSize*page)-(rowSize-1);
		  int end=rowSize*page;
		  
		  ps.setString(1, fd);
		  ps.setInt(2, start);
		  ps.setInt(3, end);
		  
		  ResultSet rs=ps.executeQuery();
		  while(rs.next())
		  {
			  FoodVO vo=new FoodVO();
			  vo.setFno(rs.getInt(1));
			  vo.setName(rs.getString(2));
			  vo.setPoster("https://www.menupan.com"+rs.getString(3));
			  vo.setAddress(rs.getString(4));
			  vo.setType(rs.getString(5));
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
  public int foodFindTotalPage(String col,String fd)
  {
	  int total=0;
	  try
	  {
		  getConnection();
		  String sql="SELECT CEIL(COUNT(*)/20.0) "
				    +"FROM food_menupan "
				    +"WHERE "+col+" LIKE '%'||?||'%'";
		  ps=conn.prepareStatement(sql);
		  ps.setString(1, fd);
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
}
