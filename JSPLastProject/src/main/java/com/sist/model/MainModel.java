package com.sist.model;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import jakarta.servlet.http.Cookie;
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
	  
	  ChefVO cvo=RecipeDAO.recipeTodayChef();
	  List<RecipeVO> rList=RecipeDAO.recipeData7();
	  
	  request.setAttribute("cvo", cvo);
	  request.setAttribute("rList", rList);
	  
	  List<FoodVO> cList=new ArrayList<FoodVO>();
	  Cookie[] cookies=request.getCookies();
	  if(cookies!=null)
	  {
		  // Cookie cookie=new Cookie("food_"+fno, fno);
		  for(int i=cookies.length-1;i>=0;i--)
		  {
			  if(cookies[i].getName().startsWith("food_"))
			  {
				  String fno=cookies[i].getValue();
				  FoodVO fvo=FoodDAO.foodCookieData(Integer.parseInt(fno));
				  // where fno=1
				  cList.add(fvo);
			  }
		  }
	  }
	  request.setAttribute("cList", cList);
	  // JSP로 값을 전송 
	  // request / session 
	  request.setAttribute("main_jsp", "../main/home.jsp");
	  // 화면 변경
	  return "../main/main.jsp";
  }
}
