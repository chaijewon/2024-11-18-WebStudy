<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp" import="com.sist.dao.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <%
    String fno=request.getParameter("fno");
	String rno=request.getParameter("rno");
	String msg=request.getParameter("msg");
	// 한글 => 깨짐 
	ReplyDAO dao=ReplyDAO.newInstance();
	// 수정 요청 
	dao.replyUpdate(Integer.parseInt(rno), msg);
	// 화면 이동 
	response.sendRedirect("MainServlet?mode=2&fno="+fno);
  %>
</body>
</html>