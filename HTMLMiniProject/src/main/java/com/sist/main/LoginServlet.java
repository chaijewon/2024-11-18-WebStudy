package com.sist.main;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

import com.sist.dao.FoodDAO;
import com.sist.vo.MemberVO;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		session.invalidate();
		response.sendRedirect("MainServlet");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		
		String id=request.getParameter("id");
		String pwd=request.getParameter("pwd");
		
		FoodDAO dao=FoodDAO.newInstance();
		MemberVO vo=dao.memberLogin(id, pwd);
		
		if(vo.getMsg().equals("OK"))
		{
			HttpSession session=request.getSession();
			session.setAttribute("id", vo.getId());
			session.setAttribute("name", vo.getName());
			session.setAttribute("sex", vo.getSex());
			// 화면 이동 
			response.sendRedirect("MainServlet");
		}
		else if(vo.getMsg().equals("NOID"))
		{
			out.println("<script>");
			out.println("alert(\"아이디가 존재하지 않습니다\");");
			out.println("history.back();");
			out.println("</script>");
		}
		else if(vo.getMsg().equals("NOPWD"))
		{
			out.println("<script>");
			out.println("alert(\"비밀번호가 틀립니다\");");
			out.println("history.back();");
			out.println("</script>");
		}
	}

}
