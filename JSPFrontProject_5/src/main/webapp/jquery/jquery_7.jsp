<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	// 같은 태그 여러개 있는 경우에 인덱스로 이용 => 0번부작
	// nth-child(1)
	$('span:eq(0)').text("Hello JQuery")
	// textContent
	$('span:eq(1)').html('<font color=red>아이디를 입력하세요</font>')
	// innerHTML
	// appendChild() => append()
})
</script>
</head>
<body>
  <span>
  
  </span><br>
  <span>
  
  </span>
</body>
</html>