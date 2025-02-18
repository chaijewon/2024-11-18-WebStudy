package com.sist.model;

import jakarta.servlet.http.HttpServletRequest;
import java.util.*;
import com.sist.vo.*;
import com.sist.dao.*;
public class ListModel implements Model {

	@Override
	public String handlerRequest(HttpServletRequest request) {
		// TODO Auto-generated method stub
		String page=request.getParameter("page");
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		Map map=new HashMap();
		map.put("start", (10*curpage)-9);
		map.put("end", 10*curpage);
		List<BoardVO> list=BoardDAO.boardListData(map);
		int totalpage=BoardDAO.boardTotalPage();
		
		request.setAttribute("list", list);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		
		return "board/list.jsp";// request를 받는 JSP
	}

}
