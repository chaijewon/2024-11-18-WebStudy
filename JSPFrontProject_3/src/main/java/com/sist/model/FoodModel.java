package com.sist.model;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import java.io.PrintWriter;
import java.util.*;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.sist.dao.*;
import com.sist.vo.*;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@Controller
public class FoodModel {
  @RequestMapping("food/food_find.do")
  public String food_find(HttpServletRequest request,
		  HttpServletResponse response)
  {
	  // 화면 이동 
	  return "../food/food_find.jsp";
  }
  @RequestMapping("food/find_js.do")
  public void find_js(HttpServletRequest request,
		  HttpServletResponse response)
  {
	  // 오라클 데이터를 읽어서 => JSON변경 => 자바스크립트 전송 
	  // 페이지 받기
	  String page=request.getParameter("page");
	  if(page==null)
		  page="1";
	  
	  String address=request.getParameter("fd");
	  if(address==null)
		  address="마포";
	  
	  
	  int curpage=Integer.parseInt(page);
	  
	  // List받기 
	  Map map=new HashMap();
	  int rowSize=12;
	  int start=(rowSize*curpage)-(rowSize-1);
	  int end=rowSize*curpage;
	  
	  map.put("start", start);
	  map.put("end", end);
	  map.put("address", address);
	  
	  List<FoodVO> list=FoodDAO.foodFindData(map);
	  
	  // 총페이지
	  int totalpage=FoodDAO.foodFindTotalPage(address);
	  
	  // 블럭 
	  final int BLOCK=10;
	  int startPage=((curpage-1)/BLOCK*BLOCK)+1;// 1 11 21
	  int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;// 10 20 30
	  
	  if(endPage>totalpage)
		  endPage=totalpage;
	  // [{},{},{}...]  List=JSONArray , VO=JSONObject
	  /*
	   *   
	   */
	  JSONArray arr=new JSONArray(); //[{}...]
	  int i=0;
	  /*
	   *   String json="{"
	   *   
	   *   +"fno"+vo.getFno()+","
	   */
	  // {fno:1,name:"",poster:""}
	  /*
	   *   {a: b: c:}
	   *   {k: L: o: a: b:}
	   */
	  for(FoodVO vo:list)
	  {
		  JSONObject obj=new JSONObject();
		  obj.put("fno", vo.getFno());
		  obj.put("name", vo.getName());
		  obj.put("poster", "https://www.menupan.com"+vo.getPoster());
		  if(i==0)
		  {
			  obj.put("curpage", curpage);
			  obj.put("totalpage", totalpage);
			  obj.put("startPage", startPage);
			  obj.put("endPage", endPage);
		  }
		  arr.add(obj);
		  i++;
	  }
	  try
	  {
		  response.setContentType("text/plain;charset=UTF-8");
		  PrintWriter out=response.getWriter();
		  // 해당 브라우저를 찾아서 
		  out.write(arr.toJSONString());
		  // JSON전송 
	  }catch(Exception ex) {}
  }
  @RequestMapping("food/detail_js.do")
  public void food_detail(HttpServletRequest request,
		  HttpServletResponse response)
  {
	  String fno=request.getParameter("fno");
	  FoodVO vo=
		FoodDAO.foodFindDetailData(Integer.parseInt(fno));
	  
	  JSONObject obj=new JSONObject();
	  obj.put("poster", "http://www.menupan.com"+vo.getPoster());
	  obj.put("name", vo.getName());
	  obj.put("score", vo.getScore());
	  obj.put("address", vo.getAddress());
	  obj.put("phone", vo.getPhone());
	  obj.put("type", vo.getType());
	  obj.put("time", vo.getTime());
	  obj.put("parking", vo.getParking());
	  obj.put("theme", vo.getTheme());
	  obj.put("content", vo.getContent());
	  
	  try
	  {
		  response.setContentType("text/plain;charset=UTF-8");
		  PrintWriter out=response.getWriter();
		  // 해당 브라우저를 찾아서 
		  out.write(obj.toJSONString());
	  }catch(Exception ex) {}
  }
}
