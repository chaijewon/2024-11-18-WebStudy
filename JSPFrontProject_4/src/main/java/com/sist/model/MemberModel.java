package com.sist.model;

import java.util.List;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.MemberDAO;
import com.sist.dao.ZipcodeVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class MemberModel {
   @RequestMapping("js/postfind.do")
   public String post_find(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   String dong=request.getParameter("dong");
	   int count=0;
	   if(dong==null)
	   {
		   request.setAttribute("count", 0);
	   }
	   else
	   {
		   MemberDAO dao=MemberDAO.newInstance();
		   List<ZipcodeVO> list=dao.postfind(dong);
		   count=dao.postfindCount(dong);
		   
		   request.setAttribute("list", list);
		   request.setAttribute("count", count);
	   }
	   return "../js/postfind.jsp";
   }
   @RequestMapping("js/join.do")
   public String joind(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   return "../js/join.jsp";
   }
}
