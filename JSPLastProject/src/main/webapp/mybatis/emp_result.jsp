<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <ul>
    <c:forEach var="vo" items="${list }">
      <li>${vo.ename }-${vo.job }-${vo.dbday }-${vo.sal }</li>
    </c:forEach>
  </ul>
</body>
</html>