<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
// 태그 속성 제어 => 문서 조작 
$(function(){
	let img=$('img').attr('src') // 속성값 읽기
	alert(img)
	$('img').attr('src','m2.jpg')// 속성값 변경
})
</script>
</head>
<body>
  <img src="m1.jpg" width="300" height="350">
</body>
</html>