<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
// 여러개를 동시에 삭제할 경우에 주로 사용 
// => 장바구니 취소 => cookie사용 
$(function(){
	// 확인
	$('#btn').click(function(){
		let len=$('input[type=checkbox]:checked').length;
		alert("선택된 취미:"+len+"개입니다")
	})
	$('#btn1').click(function(){
		$('input[type=checkbox]').prop('checked',true)
	})
	$('#btn2').click(function(){
		$('input[type=checkbox]').prop('checked',false)
	})
})
</script>
</head>
<body>
  <button id="btn">확인</button>
  <button id="btn1">전체</button>
  <button id="btn2">해제</button>
  <br>
  <input type=checkbox checked>낚시
  <input type=checkbox>운동
  <input type=checkbox>쇼핑
  <input type=checkbox>등산
  <input type=checkbox>게임
</body>
</html>
