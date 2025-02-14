<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    // 파일명?fno=10
    String fno=request.getParameter("fno");
    Cookie[] cookies=request.getCookies();
    System.out.println("fno="+fno);
    // 브라우저에 저장된 모든 cookie읽기 
    if(cookies!=null)
    {
    	for(int i=0;i<cookies.length;i++)
    	{
    		if(cookies[i].getName().equals("house_"+fno))
    		{
    			cookies[i].setPath("/");
    			cookies[i].setMaxAge(0);
    			// 쿠키 삭제
    			// 브라우저로 전송 
    			response.addCookie(cookies[i]);
    			break;
    		}
    	}
    }
    // 이동 
    response.sendRedirect("list.jsp");
%>
