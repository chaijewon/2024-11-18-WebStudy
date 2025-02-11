<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.io.*,java.util.*"%>
<%@ page import="java.text.*" %>
<%--
     import : 외부 라이브러리 첨부 
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <%
      /*
          java.lang.* 
          jakarta.servlet.*; => tomcat 10
  => javax.servlet.* => tomcat 9
          jakarta.servlet.http.*; => 생략이 가능
  => javax.servlet.http.*
      */
      Date date=new Date();
      SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
      String today=sdf.format(date);
  %>
</body>
</html>