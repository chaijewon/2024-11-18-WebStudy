package com.sist.model;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.*;
import com.sist.vo.*;
import com.sist.dao.*;
@Controller
public class AdminModel {
   @RequestMapping("adminpage/admin_main.do")
   public String adminpage_main(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   request.setAttribute("admin_jsp", "../adminpage/admin_home.jsp");
	   request.setAttribute("main_jsp", "../adminpage/admin_main.jsp");
	   return "../main/main.jsp";
   }
   @RequestMapping("adminpage/admin_reserve.do")
   public String admin_reserve(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   List<ReserveVO> list=ReserveDAO.reserveAdminPageData();
	   request.setAttribute("list", list);
	   request.setAttribute("count", list.size());
	   request.setAttribute("admin_jsp", "../adminpage/admin_reserve.jsp");
	   request.setAttribute("main_jsp", "../adminpage/admin_main.jsp");
	   return "../main/main.jsp";
   }
} 
