<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Gravity</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href="../layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">
</head>
<body id="top">
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="${main_jsp }"></jsp:include>
<jsp:include page="footer.jsp"></jsp:include>
<%--
     Jquery가 충돌하면 화면이 안나온다 
 --%>
<a id="backtotop" href="#top"><i class="fa fa-chevron-up"></i></a> 
<script src="../layout/scripts/jquery.min.js"></script> 
<script src="../layout/scripts/jquery.backtotop.js"></script> 
<script src="../layout/scripts/jquery.mobilemenu.js"></script> 
<script src="../layout/scripts/jquery.flexslider-min.js"></script>
</body>
</html>