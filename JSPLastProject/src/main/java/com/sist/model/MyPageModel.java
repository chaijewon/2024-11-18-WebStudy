package com.sist.model;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.*;
import com.sist.dao.*;
import com.sist.vo.*;
@Controller
public class MyPageModel {
  @RequestMapping("mypage/my_main.do")
  public String my_main(HttpServletRequest request,
		  HttpServletResponse response)
  {
	  request.setAttribute("my_jsp", "../mypage/my_home.jsp");
	  request.setAttribute("main_jsp", "../mypage/my_main.jsp");
	  return "../main/main.jsp";
  }
  @RequestMapping("mypage/jjim_list.do")
  public String jjim_list(HttpServletRequest request,
		  HttpServletResponse response)
  {
	  HttpSession session=request.getSession();
	  String id=(String)session.getAttribute("id");
	  List<JjimVO> list=JjimDAO.jjimFoodListData(id);
	  request.setAttribute("list", list);
	  request.setAttribute("my_jsp", "../jjim/jjim_list.jsp");
	  request.setAttribute("main_jsp", "../mypage/my_main.jsp");
	  return "../main/main.jsp";
  }
}
