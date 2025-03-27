package com.sist.model;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.PrintWriter;
import java.util.*;

import org.json.simple.JSONObject;

import com.sist.dao.*;
import com.sist.vo.*;
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
  @RequestMapping("mypage/jjim_list.do")
  public String jjim_list(HttpServletRequest request,
		  HttpServletResponse response)
  {
	  HttpSession session=request.getSession();
	  String id=(String)session.getAttribute("id");
	  List<JjimVO> list=JjimDAO.jjimFoodListData(id);
	  request.setAttribute("list", list);
	  request.setAttribute("my_jsp", "../jjim/jjim_list.jsp");
	  request.setAttribute("main_jsp", "../mypage/my_main.jsp");
	  return "../main/main.jsp";
  }
  @RequestMapping("mypage/mypage_cart_list.do")
  public String mypage_cart_list(HttpServletRequest request,
		  HttpServletResponse response)
  {
	  /*
	   *   SELECT cno,goods_name,goods_poster,goods_price,
           account,price
		    FROM cart c,goods_all g
		    WHERE c.gno=g.no
		    AND id=#{id} AND isbuy='n'
	   */
	  HttpSession session=request.getSession();
	  String id=(String)session.getAttribute("id");
	  List<CartVO> list=CartDAO.cartListData(id);
	  request.setAttribute("list", list);
	  request.setAttribute("count", list.size());
	  request.setAttribute("my_jsp", "../cart/cart_list.jsp");
	  request.setAttribute("main_jsp", "../mypage/my_main.jsp");
	  return "../main/main.jsp";
	  
  }
  @RequestMapping("mypage/mypage_buy_list.do")
  public String mypage_buy_list(HttpServletRequest request,
		  HttpServletResponse response)
  {
	  HttpSession session=request.getSession();
	  String id=(String)session.getAttribute("id");
	  List<CartVO> list=CartDAO.buyListData(id);
	  request.setAttribute("count", list.size());
	  request.setAttribute("list", list);
	  request.setAttribute("my_jsp", "../cart/buy_list.jsp");
	  request.setAttribute("main_jsp", "../mypage/my_main.jsp");
	  return "../main/main.jsp";
  }
  @RequestMapping("mypage/mypage_reserve.do")
  public String mypage_reserve(HttpServletRequest request,
		  HttpServletResponse response)
  {
	  // id 
	  HttpSession session=request.getSession();
	  String id=(String)session.getAttribute("id");
	  List<ReserveVO> list=ReserveDAO.reserveMyPageData(id);
	  request.setAttribute("list", list);
	  request.setAttribute("count", list.size());
	  request.setAttribute("my_jsp", "../mypage/mypage_reserve.jsp");
	  request.setAttribute("main_jsp", "../mypage/my_main.jsp");
	  return "../main/main.jsp";
  }
  @RequestMapping("mypage/reserve_cancel.do")
  public String reserve_cancel(HttpServletRequest request,
		  HttpServletResponse response)
  {
	  String rno=request.getParameter("rno");
	  ReserveDAO.reserveMyPageCancel(Integer.parseInt(rno));
	  return "redirect:../mypage/mypage_reserve.do";
  }
  // @RestController
  @RequestMapping("mypage/mypage_reserve_info.do")
  public void mypage_reserve_info(HttpServletRequest request,
		  HttpServletResponse response)
  {
	  String rno=request.getParameter("rno");
	  /*
	   *   rno,day,time,inwon,TO_CHAR(regdate,'YYYY-MM-DD HH24:MI:SS') as dbday,
          name,poster,address,phone,score,content,theme
	   */
	  ReserveVO vo=ReserveDAO.reserveMypageInfoData(Integer.parseInt(rno));
	  
	  JSONObject obj=new JSONObject();
	  obj.put("rno", vo.getRno());
	  obj.put("day", vo.getDay());
	  obj.put("time", vo.getTime());
	  obj.put("inwon", vo.getInwon());
	  obj.put("regdate", vo.getDbday());
	  obj.put("name", vo.getFvo().getName());
	  obj.put("poster", "https://www.menupan.com"+vo.getFvo().getPoster());
	  obj.put("address", vo.getFvo().getAddress());
	  obj.put("phone", vo.getFvo().getPhone());
	  obj.put("score", vo.getFvo().getScore());
	  obj.put("content", vo.getFvo().getContent());
	  obj.put("theme", vo.getFvo().getTheme());
	  
	  try
	  {
		  response.setContentType("text/plain;charset=UTF-8");
		  // products
		  PrintWriter out=response.getWriter();
		  out.write(obj.toJSONString());
		  // return
	  }catch(Exception ex) {}
	  
  }
}
