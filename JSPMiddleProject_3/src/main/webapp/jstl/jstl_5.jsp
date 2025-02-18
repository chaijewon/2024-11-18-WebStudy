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
   <h3>자바에서 문자열 자르기</h3>
   <%
       String colors="red,blue,green,white,black";
       StringTokenizer st=
    		     new StringTokenizer(colors,",");
       while(st.hasMoreTokens())
       {
   %>
           <%=st.nextToken() %>&nbsp;
   <%
       }
   %>
   <h3>JSTL 문자열 자르기</h3>
   <c:set var="colors" value="<%=colors %>"/>
   <c:forTokens items="${colors }" delims=","
     var="color" 
   >
      ${color }&nbsp;
   </c:forTokens>
</body>
</html>