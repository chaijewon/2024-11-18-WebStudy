package com.sist.model;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import java.util.*;
import com.sist.dao.*;
import com.sist.vo.*;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@Controller
public class SeoulModel {
  private String[] tab={"","seoul_location",
		  "seoul_nature","seoul_shop","seoul_food"};
  @RequestMapping("seoul/seoul_list.do")
  //seoul_list.do?mode=1
  /*
   *   public String seoul_list(String page,int mode
   *   
   *   MemberVO vo)
   */
  public String seoul_list(HttpServletRequest request,
		  HttpServletResponse response)
  {
	  //request.getParameterNames();
	  String mode=request.getParameter("mode");
	  String page=request.getParameter("page");
	  if(page==null)
		  page="1";
	  int curpage=Integer.parseInt(page);
	  Map map=new HashMap();
	  map.put("start", (curpage*12)-11);
	  map.put("end",curpage*12);
	  map.put("table_name", tab[Integer.parseInt(mode)]);
	  List<SeoulVO> list=SeoulDAO.seoulListData(map);
	  int totalpage=SeoulDAO.seoulTotalPage(map);
	  
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
	  request.setAttribute("mode", mode);
	  
	  request.setAttribute("main_jsp", "../seoul/seoul_list.jsp");
	  return "../main/main.jsp";
  }
}
