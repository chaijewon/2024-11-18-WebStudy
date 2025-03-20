package com.sist.model;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import java.util.*;
import com.sist.vo.*;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.sist.dao.*;
@Controller
public class CartModel {
  @RequestMapping("cart/cart_insert.do")
  public String cart_insert(HttpServletRequest request,
		  HttpServletResponse response)
  {
	  String gno=request.getParameter("gno");
	  String account=request.getParameter("account");
	  String price=request.getParameter("price");
	  
	  HttpSession session=request.getSession();
	  String id=(String)session.getAttribute("id");
	  
	  CartVO vo=new CartVO();
	  vo.setAccount(Integer.parseInt(account));
	  vo.setGno(Integer.parseInt(gno));
	  vo.setPrice(Integer.parseInt(price));
	  vo.setId(id);
	  
	  CartDAO.cartInsert(vo);
	  return "redirect:../mypage/mypage_cart_list.do";
  }
  @RequestMapping("cart/cart_cancel.do")
  public String cart_cancle(HttpServletRequest request,
		  HttpServletResponse response)
  {
	  String cno=request.getParameter("cno");
	  System.out.println("cno="+cno);
	  CartDAO.cartCancel(Integer.parseInt(cno));
	  return "redirect:../mypage/mypage_cart_list.do";
  }
}
