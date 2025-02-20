package com.sist.model;

import com.sist.ann.Controller;
import com.sist.ann.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class SeoulModel {
	  @RequestMapping("seoul/list.do")
	  public String seoul_list(HttpServletRequest request)
	  {
		  request.setAttribute("msg", "서울 여행 목록");
		  return "../seoul/list.jsp";
	  }
}
