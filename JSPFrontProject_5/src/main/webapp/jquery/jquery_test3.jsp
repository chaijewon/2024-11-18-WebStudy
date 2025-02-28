<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
let bCheck=true;
$(function(){
	$('#btn').click(function(){
		if(bCheck===true)
		{
			$('#ck').prop('checked',true)// checkbox체크
			bCheck=false
		}
		else
		{
			$('#ck').prop('checked',false)// checkbox체크 해제 
			bCheck=true
		}
		
	})
})
</script>
</head>
<body>
  <button id="btn">체크</button>
  <input type=checkbox value="ok" id="ck">확인
</body>
</html>
