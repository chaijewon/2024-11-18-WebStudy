package com.sist.model;

import com.sist.ann.Controller;
import com.sist.ann.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class FoodModel {
  @RequestMapping("food/list.do")
  public String food_list(HttpServletRequest request)
  {
	  request.setAttribute("msg", "맛집 목록");
	  return "../food/list.jsp";
  }
}
