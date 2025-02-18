<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fn" uri="jakarta.tags.functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <h3>자바 문자열 처리</h3>
  <%
      String msg="홍길동입니다";
  %>
  <%= msg.length() %><br>
  <%= msg.substring(0,3) %><br>
  <%= msg.replace('홍', '박') %>
  <h3>JSTL 문자열 처리:지도처리 = Model에서 주로 처리</h3>
  <c:set var="msg" value="홍길동입니다"/>
  ${fn:length(msg) }<br>
  ${fn:substring(msg,0,3) }<br>
  ${fn:replace(msg,'홍','심') }<br>
</body>
</html>