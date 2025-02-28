<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
    text() => 태그와 태그사이의 값 읽기
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('li').css('cursor','pointer') // css => 전체적으로 CSS적용
	// => 행위 (이벤트)
	// 마우스 => 이미지 클릭 , 키보드 입력 버튼 클릭 => 시점 
	// 값 읽기 / 값 쓰기
	$('li').click(function(){
		let data=$(this).text()
		alert("선택한 과목:"+data)
		// => 데이터 주입 
		$(this).text(data+"과정")
	})
})
</script>
</head>
<body>
  <ul>
    <li>자바</li>
    <li>오라클</li>
    <li>HTML/CSS</li>
    <li>JavaScript</li>
    <li>JSP</li>
    <li>Spring</li>
    <li>Python</li>
    <li>ElasticSearch</li>
    <li>AWS</li>
    <li>MyBatis</li>
    <li>MVC</li>
    <li>Front(Vue,React)</li>
    <li>Spring-Boot</li>
    <li>MySQL/JPA</li>
    <li>MSA</li>
    <li>CI/CD</li>
  </ul>
</body>
</html>