package com.sist.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.*;
import com.sist.model2.*;
@WebServlet("/Controller2")
public class Controller2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Map clsMap=new HashMap();
	@Override
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		clsMap.put("list", new ListModel());
		clsMap.put("insert", new InsertModel());
		clsMap.put("update", new UpdateModel());
		clsMap.put("delete", new DeleteModel());
		// xml에 등록 
	}

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 사용자 요청 
		String cmd=request.getParameter("cmd");
		Model model=(Model)clsMap.get(cmd);
		String jsp=model.execute(request);
		RequestDispatcher rd=
				  request.getRequestDispatcher(jsp);
		rd.forward(request, response);
	}

}
