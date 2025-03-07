package com.sist.model;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
// JSP (디자인) => Model => DAO => Model => JSP
//             | Conroller         |Controller
import java.util.*;
import com.sist.vo.*;
import com.sist.dao.*;
@Controller
public class FoodModel {
  @RequestMapping("food/food_list.do")
  public String food_list(HttpServletRequest request,
		  HttpServletResponse response)
  {
	  String page=request.getParameter("page");
	  if(page==null)
		  page="1";
	  int curpage=Integer.parseInt(page);
	  Map map=new HashMap();
	  map.put("start", (curpage*12)-11);
	  map.put("end",curpage*12);
	  List<FoodVO> list=FoodDAO.foodListData(map);
	  int totalpage=FoodDAO.foodTotalPage();
	  
	  final int BLOCK=10;
	  int startPage=((curpage-1)/BLOCK*BLOCK)+1;
	  int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
	  
	  if(endPage>totalpage)
		  endPage=totalpage;
	  
	  request.setAttribute("list", list);
	  request.setAttribute("curpage", curpage);
	  request.setAttribute("totalpage", totalpage);
	  request.setAttribute("startPage", startPage);
	  request.setAttribute("endPage", endPage);
	  
	  request.setAttribute("main_jsp", "../food/food_list.jsp");
	  return "../main/main.jsp";
  }
  
  @RequestMapping("food/food_detail_before.do")
  public String food_detail_before(HttpServletRequest request,
		  HttpServletResponse response)
  {
	  String fno=request.getParameter("fno");
	  Cookie cookie=new Cookie("food_"+fno, fno);
	  cookie.setPath("/");
	  cookie.setMaxAge(60*60*24);
	  // 전송 
	  response.addCookie(cookie);
	  
	  // 화면 이동 
	  return "redirect:food_detail.do?fno="+fno;
  }
  @RequestMapping("food/food_detail.do")
  public String food_detail(HttpServletRequest request,
		  HttpServletResponse response)
  {
	  String fno=request.getParameter("fno");
	  FoodVO vo=FoodDAO.foodDetailData(Integer.parseInt(fno));
	  // 경기 포천시 내촌면 내리 267
	  String addr=vo.getAddress();
	  addr=addr.substring(addr.trim().indexOf(" "));
	  // 포천시 내촌면 내리 267
	  String addr1=addr.trim();
	  addr1=addr1.substring(addr1.trim().indexOf(" "));
	  // 내촌면 내리 267
	  String addr2=addr1.trim();
	  addr2=addr1.substring(0,addr2.indexOf(" ")+1);
	  request.setAttribute("addr", addr2);
	  request.setAttribute("vo", vo);
	  request.setAttribute("main_jsp", "../food/food_detail.jsp");
	  return "../main/main.jsp";
  }
  @RequestMapping("food/food_find.do")
  public String recipe_find(HttpServletRequest request,
  		HttpServletResponse response)
  {
  	request.setAttribute("main_jsp", "../food/food_find.jsp");
  	return "../main/main.jsp";
  }
}



