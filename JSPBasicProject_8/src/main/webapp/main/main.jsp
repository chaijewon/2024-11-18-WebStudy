<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.model.*"%>
<%
    MainModel model=new MainModel();
    // <jsp:useBean id="model" class="MainModel"/>
    /*
        for(int i=1;i<=9;i++)
        	
        <c:forEach var="i" begin="1" end="9">
    */
    model.mainPage(request);
    String main_jsp=(String)request.getAttribute("main_jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
 <jsp:include page="header.jsp"></jsp:include>
 <jsp:include page="<%=main_jsp %>"></jsp:include>
</body>
</html>