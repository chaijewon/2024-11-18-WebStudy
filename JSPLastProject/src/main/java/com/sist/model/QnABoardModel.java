package com.sist.model;
import java.text.SimpleDateFormat;
import java.util.*;
import com.sist.vo.*;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.*;
@Controller
public class QnABoardModel {
  @RequestMapping("qna/qna_list.do")
  public String qna_list(HttpServletRequest request,
		  HttpServletResponse res)
  {
	   String page=request.getParameter("page");
	   if(page==null)
		   page="1";
	   
	   int curpage=Integer.parseInt(page);
	   Map map=new HashMap();
	   map.put("start", (10*curpage)-9);
	   map.put("end",10*curpage);
	   List<QnABoardVO> list=QnABoardDAO.qnaListData(map);
	   int count=QnABoardDAO.qnaRowCount();
	   int totalpage=(int)(Math.ceil(count/10.0));
	   count=count-((10*curpage)-10);
	   request.setAttribute("list", list);
	   request.setAttribute("totalpage", totalpage);
	   request.setAttribute("curpage", curpage);
	   request.setAttribute("count", count);
	   request.setAttribute("today", new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
	   
	  request.setAttribute("main_jsp", "../qna/qna_list.jsp");
	  return "../main/main.jsp";
  }
  // 명령 => Model (핵심)   <===> JSP (연결이 안됨)
  //                        | => Servlet
  @RequestMapping("qna/qna_insert.do") // 요청
  public String qna_insert(HttpServletRequest request,
		  HttpServletResponse res)
  {
	  request.setAttribute("main_jsp", "../qna/qna_insert.jsp");
	  return "../main/main.jsp";
  }
  @RequestMapping("qna/qna_insert_ok.do")
  public String qna_insert_ok(HttpServletRequest request,
		  HttpServletResponse res)
  {
	  String subject=request.getParameter("subject");
	  String content=request.getParameter("content");
	  String pwd=request.getParameter("pwd");
	  
	  HttpSession session=request.getSession();
	  String id=(String)session.getAttribute("id");
	  String name=(String)session.getAttribute("name");
	  // 데이터 유지 => 서버 자체 저장
	  QnABoardVO vo=new QnABoardVO();
	  vo.setId(id);
	  vo.setName(name);
	  vo.setSubject(subject);
	  vo.setContent(content);
	  vo.setPwd(pwd);
	  
	  QnABoardDAO.qnaInsert(vo);
	  return "redirect:../qna/qna_list.do";
  }
  
  // 관리자 
  @RequestMapping("admin/qna_admin_list.do")
  public String qna_admin_list(HttpServletRequest request,
		  HttpServletResponse res)
  {
	   String page=request.getParameter("page");
	   if(page==null)
		   page="1";
	   
	   int curpage=Integer.parseInt(page);
	   Map map=new HashMap();
	   map.put("start", (10*curpage)-9);
	   map.put("end",10*curpage);
	   List<QnABoardVO> list=QnABoardDAO.qnaAdminListData(map);
	   
	   int count=QnABoardDAO.qnaAdminRowCount();
	   int totalpage=(int)(Math.ceil(count/10.0));
	   count=count-((10*curpage)-10);
	   request.setAttribute("list", list);
	   request.setAttribute("totalpage", totalpage);
	   request.setAttribute("curpage", curpage);
	   request.setAttribute("count", count);
	   request.setAttribute("today", new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
	   request.setAttribute("admin_jsp", "../qna/qna_admin_list.jsp");
	   request.setAttribute("main_jsp", "../adminpage/admin_main.jsp");
	   return "../main/main.jsp";
  }
  
}
