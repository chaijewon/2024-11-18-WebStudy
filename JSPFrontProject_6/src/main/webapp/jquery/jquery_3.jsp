<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container{
 margin-top: 50px;
}
.row{
  margin: opx auto;
  width: 350px;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('img').css({
		width:120,
		height:180
	})
	// mousedown => img / input 
	$('img').mousedown(function(){
		$(this).attr('class','img-circle')
		// addClass()
	})
	$('img').mouseup(function(){
		$(this).attr('class','')
		// removeClass
	})
	
	$('img').hover(function(){
		$(this).css('cursor','pointer')
		$(this).css('opacity',0.3)
	},function(){
		$(this).css('cursor','none')
		$(this).css('opacity',1.0)
	})
	
	/*
	    $(태그선택자).함수()
	               -----
	               이벤트 / 속성값 주입 (변경) / CSS 처리 
	               값 읽기 / 값 주입
	               display : show/hide
	                         더보기 / 상세보기 
	               태그.style.display='' => show()
	               태그.style.display='none' => hide()
	    => 태그를 제어하는 프로그램 (DOMScript)
	       => 기타 : 효과 fadeIn fadeOut
	*/
})
</script>
</head>
<body>
  <img src="m1.jpg">
  <img src="m2.jpg">
  <img src="m3.jpg">
  <img src="m4.jpg">
  <img src="m5.jpg">
  <img src="m6.jpg">
  <img src="m7.jpg">
</body>
</html>