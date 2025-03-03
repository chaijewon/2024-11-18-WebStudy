<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#circle {

  width : 25px;
  height : 25px;
  border-radius: 50%;
  background-color: tomato;

}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#circle').css('backgroundColor','rgb('+Math.random(256)+','+Math.random(256)+','+Math.random(256)+')')
})
</script>
</head>
<body>
  <div id="circle"><center><b>홍</b></center></div>
</body>
</html>