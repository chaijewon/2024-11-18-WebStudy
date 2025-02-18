package com.sist.model;

import jakarta.servlet.http.HttpServletRequest;
// Controller + MyBatis(DML) => CRUD
public class DetailModel implements Model {

	@Override
	public String handlerRequest(HttpServletRequest request) {
		// TODO Auto-generated method stub
		System.out.println("DetailModel Call..");
		return null;
	}

}
