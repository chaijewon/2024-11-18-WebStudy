package com.sist.model;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
/*
 *   (HttpServletRequest request,
		   HttpServletResponse response)
 */
import java.util.*;
import com.sist.dao.*;
import com.sist.vo.*;
@Controller
public class BoardModel {
   @RequestMapping("board/board_list.do")
   public String board_list(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   String page=request.getParameter("page");
	   if(page==null)
		   page="1";
	   
	   int curpage=Integer.parseInt(page);
	   Map map=new HashMap();
	   map.put("start", (10*curpage)-9);
	   map.put("end",10*curpage);
	   List<BoardVO> list=BoardDAO.boardListData(map);
	   int totalpage=BoardDAO.boardTotalPage();
	   
	   request.setAttribute("list", list);
	   request.setAttribute("totalpage", totalpage);
	   request.setAttribute("curpage", curpage);
	   
	   request.setAttribute("main_jsp", "../board/board_list.jsp");
	   return "../main/main.jsp";
   }
   @RequestMapping("board/board_insert.do")
   public String board_insert(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   request.setAttribute("main_jsp", "../board/board_insert.jsp");
	   return "../main/main.jsp";
   }
   @RequestMapping("board/board_insert_ok.do")
   public String board_insert_ok(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   String name=request.getParameter("name");
	   String subject=request.getParameter("subject");
	   String content=request.getParameter("content");
	   String pwd=request.getParameter("pwd");
	   
	   BoardVO vo=new BoardVO();
	   vo.setName(name);
	   vo.setSubject(subject);
	   vo.setContent(content);
	   vo.setPwd(pwd);
	   
	   BoardDAO.boardInsert(vo);
	   return "redirect:../board/board_list.do";
   }
}
