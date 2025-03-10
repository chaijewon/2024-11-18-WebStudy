package com.sist.model;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

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
}
