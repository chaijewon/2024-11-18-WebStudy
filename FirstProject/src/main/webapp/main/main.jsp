<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   String mode=request.getParameter("mode");
   if(mode==null)
	   mode="0";
   int index=Integer.parseInt(mode);
   String jsp="";
   switch(index)
   {
     case 0:
    	 jsp="home.jsp";
         break;
     case 1:
    	 jsp="../food/detail.jsp";
    	 break;
   }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
.row{
  margin: 0px auto;
  width: 960px;
}
</style>
</head>
<body>
  <jsp:include page="header.jsp"></jsp:include>
  <div class="container">
    <jsp:include page="<%=jsp %>"></jsp:include>
  </div>
</body>
</html>