package com.sist.main;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.*;

@WebServlet("/MainServlet")
public class MainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		
		out.println("<html>");
		out.println("<head>");
		out.println("<link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css\">");
		out.println("<link rel=stylesheet href=css/food.css>");
		out.println("</head>");
		out.println("<body>");
		out.println("<div class=container>");
		out.println("<div class=row>");
		out.println("<div class=text-center style=\"margin-top:150px\">");
		out.println("<a href=FoodList class=\"btn btn-lg btn-danger\">맛집</a>");
		out.println("<a href=MusicList class=\"btn btn-lg btn-success\">뮤직</a>");
		out.println("<div>");
		out.println("</div>");
		out.println("</div>");
		out.println("</div>");
		out.println("</body>");
		out.println("</html>");
		
	}

}
