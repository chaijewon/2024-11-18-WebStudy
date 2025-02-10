<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
       Spring Framework 
       => 톰캣 9까지만 사용이 가능 (JDK 11)
          ----------------------------
 --%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <h1>구구단</h1>
  <!-- Spring -->
  <table border=1 bordercolor=black width=600>
    <tr>
      <c:forEach var="i" begin="2" end="9">
           <th>${i }단</th>
      </c:forEach>
    </tr>
    <c:forEach var="i" begin="1" end="9">
      <tr>
       <c:forEach var="j" begin="2" end="9">
         <td>${j }*${i }=${i*j }</td>
       </c:forEach>
      </tr>
    </c:forEach>
  </table>
</body>
</html>