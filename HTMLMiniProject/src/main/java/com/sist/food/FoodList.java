package com.sist.food;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Cookie;
import java.io.*;
import java.util.*;
import com.sist.dao.*;
import com.sist.vo.*;
@WebServlet("/FoodList")
public class FoodList extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 브라우저로 전송 => HTML을 전송한다 
		// HTML,XML,JSON => response(HTML,Cookie전송이 가능)
		response.setContentType("text/html;charset=UTF-8");
		// 2. 브라우저 연결 
		PrintWriter out=response.getWriter();
		
		// 3. 출력전에 오라클 데이터 읽기
		FoodDAO dao=FoodDAO.newInstance();
		// 4. 사용자 요청 = 데이터 받기 
		String page=request.getParameter("page");
		if(page==null)
			page="1"; // 초기값 지정 => 오류 
		// 현재페이지 설정
		int curpage=Integer.parseInt(page);
		// 현재 페이지에 대한 데이터 얻기
		List<FoodVO> list=dao.foodListData(curpage);
		// 총페이지 읽기 
		int totalpage=dao.foodTotalPage();
		
		// 블럭별 페이지 
		final int BLOCK=10;
		/*
		 *  1~10 => startPage = 1
		 *  1~10 => endPage = 10
		 *  
		 *  11~20 => startPage = 11
		 */
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		//               10-1 => 9/10 0
		//               11-1/10 => 1*10 => 10+1 => 11
		// 1 11 21 31 ...
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		// 10 20 30 40...
		if(endPage>totalpage)
		    endPage=totalpage;
		
		
		out.println("<html>");
		out.println("<head>");
		out.println("<link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css\">");
		out.println("<link rel=stylesheet href=css/food.css>");
		out.println("</head>");
		out.println("<body>");
		out.println("<div class=container>");
		out.println("<div class=row>");
		/*
		 *   response는 기능을 한개 수행이 가능 
		 *   ----------------------------
		 *   1. 쿠키 전송 => Detail이동 => HTML전송 
		 *   2. HTML전송 
		 *   
		 */
		for(FoodVO vo:list)
		{
			out.println("<div class=\"col-md-3\">");
			out.println("<div class=\"thumbnail\">");
			out.println("<a href=\"FoodBeforeDetail?fno="+vo.getFno()+"\">");
			out.println("<img src="+vo.getPoster()+" style=\"width:230px;height:150px\">");
			out.println("<div class=\"caption\">");
			out.println("<p>"+vo.getName()+"</p>");
			out.println("</div>");
			out.println("</a>");
			out.println("</div>");
			out.println("</div>");
		}
		out.println("</div>");
		out.println("<div class=\"row text-center\">");
		out.println("<ul class=\"pagination\">");
		// startPage = 1 , 11 , 21
		if(startPage>1)
		{
		  out.println("<li><a href=\"FoodList?page="+(startPage-1)+"\">&lt;</a></li>");
		}
		
		for(int i=startPage;i<=endPage;i++)
		{
		 if(i==curpage)
		  out.println("<li class=active><a href=\"FoodList?page="+i+"\">"+i+"</a></li>");
		 else
		  out.println("<li><a href=\"FoodList?page="+i+"\">"+i+"</a></li>");
		}
		
		if(endPage<totalpage)
		{
		  out.println("<li><a href=\"FoodList?page="+(endPage+1)+"\">&gt;</a></li>");
		}
		out.println("</ul>");
		out.println("</div>");
		out.println("<div class=row>");
		out.println("<h3>최신 방문 맛집</h3>");
		out.println("<hr>");
		List<FoodVO> cList=new ArrayList<FoodVO>();
		Cookie[] cookies=request.getCookies();
		if(cookies!=null)// cookie에 값이 값이 저장된 상태면 
		{
			// 키 , 값 => getValue
			// => getName 
			// 최신순으로 
			for(int i=cookies.length-1;i>=0;i--)
			{
				if(cookies[i].getName().startsWith("food_"))
				{
					String fno=cookies[i].getValue();
					FoodVO vo=dao.foodCookieData(Integer.parseInt(fno));
					cList.add(vo);
				}
			}
		}
		for(int i=0;i<cList.size();i++)
		{
			FoodVO cvo=cList.get(i);
			if(i>8) break;
			out.println("<a href=FoodDetail?fno="+cvo.getFno()+">");
			out.println("<img src="+cvo.getPoster()+" style=\"width:100px;height:100px\" class=img-rounded title="+cvo.getName()+">");
			out.println("</a>");
		}
		out.println("</div>");
		out.println("</div>");
		out.println("</body>");
		out.println("</html>");
		
	}

}
