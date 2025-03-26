<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
	$('.inwons').click(function(){
		let inwon=$(this).text()
		$('#food_reserve_inwon').text(inwon)
		$('#reserveBtn').show()
		$('#rinwon').val(inwon)
	})
})
</script>
</head>
<body>
  <c:forEach var="i" begin="2" end="10">
    <span class="btn btn-xs btn-warning inwons" style="margin-left: 3px;margin-top: 5px">${i }명</span>
  </c:forEach>
    <span class="btn btn-xs btn-warning inwons">단체</span>
</body>
</html>