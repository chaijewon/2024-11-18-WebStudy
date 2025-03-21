package com.sist.main;
import java.util.*;
import java.sql.*;
public class ReserveDAO {
   private Connection conn;
   private PreparedStatement ps;
   private final String URL="jdbc:oracle:thin:@localhost:1521:XE";
   private static ReserveDAO dao;
   
   public ReserveDAO()
   {
	   try
	   {
		   Class.forName("oracle.jdbc.driver.OracleDriver");
	   }catch(Exception ex) {}
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
		   if(ps!=null) ps.close();
		   if(conn!=null) conn.close();
	   }catch(Exception ex) {}
   }
   public static ReserveDAO newInstance()
   {
	   if(dao==null)
		   dao=new ReserveDAO();
	   return dao;
   }
   // ssf
   // mapper
   public List<Integer> foodGetFno()
   {
	   List<Integer> list=new ArrayList<Integer>();
	   try
	   {
		   getConnection();
		   String sql="SELECT fno FROM project_food "
				     +"ORDER BY fno ASC";
		   ps=conn.prepareStatement(sql);
		   ResultSet rs=ps.executeQuery();
		   while(rs.next())
		   {
			   int fno=rs.getInt(1);
			   list.add(fno);
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
   public void foodRdaysUpdate(int fno,String rday)
   {
	   try
	   {
		   getConnection();
		   String sql="UPDATE project_food SET "
				     +"rdays=? "
				     +"WHERE fno=?";
		   ps=conn.prepareStatement(sql);
		   ps.setString(1, rday);
		   ps.setInt(2, fno);
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
