package com.sist.model;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@Controller
public class ReserveModel {
  @RequestMapping("reserve/reserve_main.do")
  public String reserve_main(HttpServletRequest request,
		  HttpServletResponse response)
  {
	  request.setAttribute("main_jsp", "../reserve/reserve_main.jsp");
	  return "../main/main.jsp";
  }
}




