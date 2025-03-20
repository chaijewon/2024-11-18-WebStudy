package com.sist.model;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import java.util.*;
import com.sist.dao.*;
import com.sist.vo.*;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@Controller
public class GoodsModel {
	  @RequestMapping("goods/goods_list.do")
	  public String food_list(HttpServletRequest request,
			  HttpServletResponse response)
	  {
		  String page=request.getParameter("page");
		  if(page==null)
			  page="1";
		  int curpage=Integer.parseInt(page);
		  Map map=new HashMap();
		  map.put("start", (curpage*12)-11);
		  map.put("end",curpage*12);
		  List<GoodsVO> list=GoodsDAO.goodsListData(map);
		  int totalpage=GoodsDAO.goodsTotalPage();
		  
		  final int BLOCK=10;
		  int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		  int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		  
		  if(endPage>totalpage)
			  endPage=totalpage;
		  
		  request.setAttribute("list", list);
		  request.setAttribute("curpage", curpage);
		  request.setAttribute("totalpage", totalpage);
		  request.setAttribute("startPage", startPage);
		  request.setAttribute("endPage", endPage);
		  
		  request.setAttribute("main_jsp", "../goods/goods_list.jsp");
		  return "../main/main.jsp";
	  }
	  @RequestMapping("goods/goods_detail.do")
	  public String goods_detail(HttpServletRequest request,
			  HttpServletResponse response)
	  {
		  System.out.println("good-detail");
		  String no=request.getParameter("no");
		  GoodsVO vo=GoodsDAO.goodsDetailData(Integer.parseInt(no));
		  String price=vo.getGoods_price();
		  price=price.replaceAll("[^0-9]", "");
		  vo.setPrice(Integer.parseInt(price));
		  request.setAttribute("vo", vo);
		  request.setAttribute("main_jsp", "../goods/goods_detail.jsp");
		  return "../main/main.jsp";
	  }
}
