package com.sist.model;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class MovieModel {
   private String[] urls={
		"",
		"searchMainDailyBoxOffice.do",
		"searchMainRealTicket.do",
		"searchMainDailySeatTicket.do"
   };
   // https://www.kobis.or.kr/kobis/business/main/main.do
   @RequestMapping("movie/list.do")
   public String movie_list(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   String no=request.getParameter("no");
	   if(no==null)
		   no="1";
	   String url="https://www.kobis.or.kr/kobis/business/main/"
			      +urls[Integer.parseInt(no)];
	   // JSON 
	   return "../movie/list.jsp";
   }
}
