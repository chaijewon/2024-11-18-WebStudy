package com.sist.model;

import jakarta.servlet.http.HttpServletRequest;

public class InsertModel implements Model{

	@Override
	public String handlerRequest(HttpServletRequest request) {
		// TODO Auto-generated method stub
		return "board/insert.jsp";
	}

}
