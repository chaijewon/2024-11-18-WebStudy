<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <h3>출력 형식</h3>
  <%
      List<String> names=new ArrayList<String>();
      for(char c='A';c<='Z';c++)
      {
    	  names.add(String.valueOf(c));
      }
  %>
  <c:set var="names" value="<%=names %>"/>
  <%-- request.setAttribute("names",names) --%>
  <c:forEach var="alpha" items="${names }">
    ${alpha }&nbsp;
  </c:forEach>
  <br>
  <%--
     자바스크립트 : $
   --%>
  <c:forEach var="alpha" items="${names }">
    <c:out value="${alpha }"/>&nbsp;
  </c:forEach>
</body>
</html>