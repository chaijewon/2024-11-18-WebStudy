package com.sist.main;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.*;

import com.sist.food.FoodList;

@WebServlet("/MainServlet")
public class MainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=
				response.getWriter();
		String mode=request.getParameter("mode");
		if(mode==null)
			mode="1";
		String name="";
		switch(Integer.parseInt(mode))
		{
		case 1:
			name="FoodList";
			break;
			
		case 2:
			name="MusicList";
			break;
		}
		out.println("<html>");
		out.println("<head>");
		out.println("<link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css\">");
		out.println("<link rel=stylesheet href=css/food.css>");
		out.println("</head>");
		out.println("<body>");
		String html="<nav class=\"navbar navbar-inverse\">"
				+ "  <div class=\"container-fluid\">"
				+ "    <div class=\"navbar-header\">"
				+ "      <a class=\"navbar-brand\" href=\"#\">Servlet Site</a>"
				+ "    </div>\r\n"
				+ "    <ul class=\"nav navbar-nav\">"
				+ "      <li class=\"active\"><a href=\"#\">Home</a></li>"
				+ "      <li><a href=\"MainServlet?mode=1\">맛집</a></li>"
				+ "      <li><a href=\"MainServlet?mode=2\">뮤직</a></li>"
				+ "      <li><a href=\"#\">회원</a></li>"
				+ "    </ul>"
				+ "  </div>"
				+ "</nav>";
		out.println(html);
		RequestDispatcher rd=
				request.getRequestDispatcher(name);
		rd.include(request, response);
		out.println("</body>");
		out.println("</html>");
	}

}
