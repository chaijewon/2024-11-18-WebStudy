package com.sist.model;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class MemberModel {
   @RequestMapping("member/join.do")
   public String member_join(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   // include 
	   request.setAttribute("main_jsp", "../member/join.jsp");
	   return "../main/main.jsp";
   }
}
