package com.sist.model;

import jakarta.servlet.http.HttpServletRequest;

public class ListModel implements Model{

	@Override
	public String handlerRequest(HttpServletRequest request) {
		// TODO Auto-generated method stub
		
		return "board/list.jsp";
	}

}
