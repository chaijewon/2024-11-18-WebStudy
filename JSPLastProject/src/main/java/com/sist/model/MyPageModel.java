package com.sist.model;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.*;
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
}
