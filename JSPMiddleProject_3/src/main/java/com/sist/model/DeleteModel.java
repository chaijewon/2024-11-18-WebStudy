package com.sist.model;

import jakarta.servlet.http.HttpServletRequest;

public class DeleteModel {
	  public void execute(HttpServletRequest request)
	  {
		  request.setAttribute("msg", "게시판 삭제");
	  }
}
