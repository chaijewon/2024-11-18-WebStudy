<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   // 170 ~ 171
   //1. 사용자가 보내준 값을 받는다 
   String name=request.getParameter("name");
   String sex=request.getParameter("sex");
   String loc=request.getParameter("loc");
   String content=request.getParameter("content");
   String[] hobby=request.getParameterValues("hobby");
   // 마이페이지 / 관리자페이지 => 게시물 , 장바구니 , 예약정보 / 쿠키 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
***1. 사용자의 IP:<%= request.getRemoteAddr() %><br>
2. 사용자의 PORT:<%=request.getRemotePort() %><br>
3. 서버이름 : <%= request.getServerName() %><br>
4. 서버PORT: <%= request.getServerPort() %><br>
5. 데이터 전송방식:<%= request.getMethod() %><br>
6. 사용자가 요청한 URL=<%= request.getRequestURL() %><br>
***7. 사용자가 요청한 URI=<%=request.getRequestURI() %><br>
***8. 사용자가 요청한 기본폴더: <%= request.getContextPath() %><br>
9. 사용자 보내준 데이터 :<br>
   이름:<%=name %><br>
   성별:<%=sex %><br>
   주소:<%=loc %><br>
   소개:<%=content %><br>
   취미:<%= Arrays.toString(hobby) %>
   
</body>
</html>


