package com.sist.model;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import java.util.*;
import com.sist.dao.*;
import com.sist.vo.*;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@Controller
public class ReplyModel {
  private String[] urls={"","food/food_detail.do?fno=",
		  "recipe/recipe_detail.do?no=","",""};
  
  @RequestMapping("reply/reply_insert.do")
  public String reply_insert(HttpServletRequest request,
		  HttpServletResponse response)
  {
	  String rno=request.getParameter("rno");
	  String type=request.getParameter("type");
	  String msg=request.getParameter("msg");
	  
	  HttpSession session=request.getSession();
	  String id=(String)session.getAttribute("id");
	  String name=(String)session.getAttribute("name");
	  String sex=(String)session.getAttribute("sex");
	  
	  ReplyVO vo=new ReplyVO();
	  vo.setId(id);
	  vo.setName(name);
	  vo.setSex(sex);
	  
	  vo.setMsg(msg);
	  vo.setType(Integer.parseInt(type));
	  vo.setRno(Integer.parseInt(rno));
	  
	  ReplyDAO.replyInsert(vo);
	  
	  return "redirect:../"+urls[Integer.parseInt(type)]+rno;
  }
  // ?cno=${rvo.cno }$rno=${rvo.rno}&type=1
  @RequestMapping("reply/reply_delete.do")
  public String reply_delete(HttpServletRequest request,
		  HttpServletResponse response)
  {
	  String cno=request.getParameter("cno");
	  String rno=request.getParameter("rno");
	  String type=request.getParameter("type");
	  
	  
	  ReplyDAO.replyDelete(Integer.parseInt(cno));
	  return "redirect:../"+urls[Integer.parseInt(type)]+rno;
  }
  
  @RequestMapping("reply/reply_update.do")
  public String reply_update(HttpServletRequest request,
		  HttpServletResponse response)
  {
	  String cno=request.getParameter("cno");
	  String rno=request.getParameter("rno");
	  String type=request.getParameter("type");
	  String msg=request.getParameter("msg");
	  
	  ReplyVO vo=new ReplyVO();
	  vo.setCno(Integer.parseInt(cno));
	  vo.setMsg(msg);
	  
	  ReplyDAO.replyUpdate(vo);
	  return "redirect:../"+urls[Integer.parseInt(type)]+rno;
  }
}
