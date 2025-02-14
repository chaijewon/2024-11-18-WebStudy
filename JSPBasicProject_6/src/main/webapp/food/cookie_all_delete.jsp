<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
     Cookie[] cookies=request.getCookies();
     if(cookies!=null)
     {
    	 for(int i=0;i<cookies.length;i++)
    	 {
    		 if(cookies[i].getName().startsWith("house_"))
    		 {
    			 cookies[i].setPath("/");
    			 cookies[i].setMaxAge(0);
    			 response.addCookie(cookies[i]);
    		 }
    	 }
     }
     response.sendRedirect("list.jsp");
%>