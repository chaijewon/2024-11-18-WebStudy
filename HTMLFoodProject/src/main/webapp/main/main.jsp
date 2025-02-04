<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String fno=request.getParameter("fno");
Cookie cookie=new Cookie("food_"+fno, fno);
cookie.setPath("/"); // 저장 위치 지정 
cookie.setMaxAge(60*60*24); // 저장 기간 => 1일 
response.addCookie(cookie); // 브라우저 전송 
// 쿠키 => 브라우저에 저장 (클라이언트에 저장) 
// 보안에 취약 / 저장 => 문자열만 저장이 가능 
// => 최신 방문 / 로그인 여부 
// => 서버에 저장 (세션) 
// => Map방식 (키,값) => 키는 중복이 불가능 
// 상세보기로 이동 => 서버에서 화면 이동 : response.sendRedirect()
response.sendRedirect("FoodDetail?fno="+fno);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>