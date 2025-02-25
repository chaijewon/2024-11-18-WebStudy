<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
    객체 표현 
    let sawon={} => 변수 / 함수 
    형식) {sabun:1,name:"홍길동",dept:"개발부"} => 자바 VO
         => ROW
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
window.onload=function(){
	// [{},{},{},{}...]
	let sawon={
		sabun:1,
		name:"홍길동",
		dept:"개발부",
		job:"대리",
		pay:3500
	}
	document.write("사번:"+sawon.sabun+"<br>")
	document.write("이름:"+sawon.name+"<br>")
	document.write("부서:"+sawon.dept+"<br>")
	document.write("직위:"+sawon.job+"<br>")
	document.write("연봉:"+sawon.pay+"<br>")
	document.write("<hr>")
	document.write("사번:"+sawon['sabun']+"<br>")
	document.write("이름:"+sawon['name']+"<br>")
	document.write("부서:"+sawon['dept']+"<br>")
	document.write("직위:"+sawon['job']+"<br>")
	document.write("연봉:"+sawon['pay']+"<br>")
	document.write('<hr>')
	for(let key in sawon) // for in => []은 인덱스번호 
	                      // {}일 경우에는 key읽기
	                      // {sabun:1} => key ,value => Map
	                      // JSON => 서버에서 자바스크립트로 전송 
	                      // 서버 => JSON => 핸드폰 
	{
		document.write(sawon[key]+"<br>")
	}
}
</script>
</head>
<body>

</body>
</html>