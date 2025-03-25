package com.sist.model;

import java.util.*;
import java.util.List;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.ReserveDAO;
import com.sist.vo.FoodVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@Controller
public class ReserveModel {
  @RequestMapping("reserve/reserve_main.do")
  public String reserve_main(HttpServletRequest request,
		  HttpServletResponse response)
  {
	  request.setAttribute("main_jsp", "../reserve/reserve_main.jsp");
	  return "../main/main.jsp";
  }
  @RequestMapping("reserve/reserve_food_info.do")
  public String reserve_food_info(HttpServletRequest request,
		  HttpServletResponse response)
  {
	  System.out.println("reserve_food_info.do");
	  String type=request.getParameter("type");
	  if(type==null)
		  type="한식";
	  Map map=new HashMap();
	  map.put("type", type);
	  List<FoodVO> list=ReserveDAO.reserveFoodData(map);
	  request.setAttribute("fList", list);
	  return "../reserve/reserve_food_info.jsp";
  }
}




