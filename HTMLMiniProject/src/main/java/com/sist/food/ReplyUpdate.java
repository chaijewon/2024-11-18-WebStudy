package com.sist.food;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
/*
 *   tomcat => 9버전 
 *       javax.servlet
 *   => request.setCharacterEncoding("UTF-8")
 *      => 실무 
 *      => Spring Tool => STS (9버전까지만 사용이 가능) 
 *      => JDK 14
 *   tomcat => 10버전 이상 (11버전)
 *       jakarta.servlet
 *   => 자동 디코딩 
 *   
 *   => STS 4 => 자동 tomcat (내장) => 임베디드 톰캣 
 *      ------ Spring-Boot만 가능
 */
import com.sist.dao.*;
@WebServlet("/ReplyUpdate")
public class ReplyUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fno=request.getParameter("fno");
		String rno=request.getParameter("rno");
		String msg=request.getParameter("msg");
		// 한글 => 깨짐 
		ReplyDAO dao=ReplyDAO.newInstance();
		// 수정 요청 
		dao.replyUpdate(Integer.parseInt(rno), msg);
		// 화면 이동 
		response.sendRedirect("MainServlet?mode=2&fno="+fno);
	}

}
