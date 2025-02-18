package com.sist.model2;

import jakarta.servlet.http.HttpServletRequest;

public class DeleteModel implements Model {

	@Override
	public String execute(HttpServletRequest request) {
		// TODO Auto-generated method stub
		request.setAttribute("msg", "답변형 게시판 데이터 삭제");
		return "board/delete.jsp";
	}

}
