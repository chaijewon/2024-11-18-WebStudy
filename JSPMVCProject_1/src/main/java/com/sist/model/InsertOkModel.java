package com.sist.model;

import jakarta.servlet.http.HttpServletRequest;
import com.sist.dao.*;
import com.sist.vo.*;
public class InsertOkModel implements Model{

	@Override
	public String handlerRequest(HttpServletRequest request) {
		// TODO Auto-generated method stub
		// 데이터를 받는다 
		String name=request.getParameter("name");
		String subject=request.getParameter("subject");
		String content=request.getParameter("content");
		String pwd=request.getParameter("pwd");
		BoardVO vo=new BoardVO();
		vo.setName(name);
		vo.setSubject(subject);
		vo.setContent(content);
		vo.setPwd(pwd);
		BoardDAO.boardInsert(vo);
		return "redirect:list.do";
	}

}
