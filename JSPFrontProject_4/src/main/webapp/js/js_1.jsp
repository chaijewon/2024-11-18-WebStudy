<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
       내장 객체 
       -------
       내장 객체 
         String 
         Math 
         Array 
         Number
         Date 
       브라우저 내장 객체
            window : 브라우저 => open/close
              |
       ------------------------
       |        |      |       |
     document history location 
     -------- ------- -------- 이동 : href="이동파일 지정"
               | 이동 
                 back()
                 forward()
                 reload()
     HTML문서제어
     
     기초 : Jquery => Ajax 
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
//window.open("","","width=640,height=400")
window.onload=function(){
	let won=100000
	document.write(won.toLocaleString())
}
</script>
</head>
<body>

</body>
</html>