package com.sist.model;

import jakarta.servlet.http.HttpServletRequest;

public class InsertModel {
	  public void execute(HttpServletRequest request)
	  {
		  request.setAttribute("msg", "게시판 글쓰기");
	  }
}
