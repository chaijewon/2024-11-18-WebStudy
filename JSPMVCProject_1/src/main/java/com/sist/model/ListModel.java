package com.sist.model;

import jakarta.servlet.http.HttpServletRequest;
import java.util.*;
import com.sist.dao.*;
import com.sist.vo.*;
public class ListModel implements Model{

	@Override
	public String handlerRequest(HttpServletRequest request) {
		// TODO Auto-generated method stub
		//1. 사용자 요청 => page
		String page=request.getParameter("page");
		if(page==null)
			page="1"; // default page
		
		// 현재 페이지 지정 
		int curpage=Integer.parseInt(page);
		// 데이터 읽기 
		
		return "board/list.jsp";
	}

}
