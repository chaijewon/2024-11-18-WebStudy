package com.sist.model;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.*;
import com.sist.dao.*;
import com.sist.vo.*;
@Controller
public class MainModel {
  @RequestMapping("main/main.do")
  public String main_main(HttpServletRequest request,
		  HttpServletResponse response)
  {
	  FoodVO vo=FoodDAO.foodMainHouseData();
	  List<FoodVO> fList=FoodDAO.foodMainHouseData8();
	  // chefList => recipeList => newsList => cookieList
	  request.setAttribute("fvo", vo);
	  request.setAttribute("fList", fList);
	  // JSP로 값을 전송 
	  // request / session 
	  request.setAttribute("main_jsp", "../main/home.jsp");
	  // 화면 변경
	  return "../main/main.jsp";
  }
}
