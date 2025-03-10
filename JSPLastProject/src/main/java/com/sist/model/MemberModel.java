package com.sist.model;

import java.io.PrintWriter;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.MemberDAO;
import com.sist.vo.MemberVO;

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
   
   @RequestMapping("member/idcheck.do")
   public String member_idcheck(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   return "../member/idcheck.jsp";
   }
   
   @RequestMapping("member/idcheck_ok.do")
   public void member_idcheck_ok(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   // void => 일반 데이터 (String , int)
	   // => JSON
	   // data:{"id":id.trim()} ?id=aaa
	   String id=request.getParameter("id");
	   int count=MemberDAO.memberIdcheck(id);
	   
	   try
	   {
		   response.setContentType("text/html;charset=UTF-8");
		   PrintWriter out=response.getWriter();
		   out.write(String.valueOf(count));
		   // int => char
	   }catch(Exception ex) {}
	   
   }
   @RequestMapping("member/join_ok.do")
   public String member_join_ok(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   String id=request.getParameter("id");
	   String pwd=request.getParameter("pwd");
	   String name=request.getParameter("name");
	   String sex=request.getParameter("sex");
	   String birthday=request.getParameter("birthday");
	   String email=request.getParameter("email");
	   String post=request.getParameter("post");
	   String addr1=request.getParameter("addr1");
	   String addr2=request.getParameter("addr2");
	   String phone1=request.getParameter("phone1");
	   String phone2=request.getParameter("phone2");
	   String content=request.getParameter("content");
	   
	   MemberVO vo=new MemberVO();
	   vo.setId(id);
	   vo.setPwd(pwd);
	   vo.setName(name);
	   vo.setSex(sex);
	   vo.setBirthday(birthday);
	   vo.setEmail(email);
	   vo.setPost(post);
	   vo.setAddr1(addr1);
	   vo.setAddr2(addr2);
	   vo.setPhone(phone1+"-"+phone2);
	   vo.setContent(content);
	   
	   MemberDAO.memberInsert(vo);
	   return "redirect:../main/main.do";
   }
   @RequestMapping("member/login.do")
   public String member_login(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   return "../member/login.jsp";
   }
   // 로그인 
   // 로그아웃 
}
