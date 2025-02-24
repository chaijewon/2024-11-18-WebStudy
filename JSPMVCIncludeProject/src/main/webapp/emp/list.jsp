<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script type="text/javascript">
window.onload=function(){
	// 서버 연결 => 요청 
	axios.get('http://localhost/JSPMVCIncludeProject/emp/list_js.do')
	.then(function(response){
		// 서버에서 들어오는 결과값을 받아서 처리
		console.log(response.data)
		let data=response.data
		let html=''
		data.map(function(emp){
			html+='<tr>'
			    +'<td>'+emp.empno+'</td>'
			    +'<td>'+emp.ename+'</td>'
			    +'<td>'+emp.job+'</td>'
			    +'<td>'+emp.hiredate+'</td>'
			    +'<td>'+emp.sal+'</td>'
			    +'<tr>'
		})
		document.querySelector('tbody').innerHTML=html;
	})
}
</script>
</head>
<body>
<div class="wrapper row3">
  <main class="container clear"> 
    <table class="table">
      <thead>
        <tr>
          <th>사번</th>
          <th>이름</th>
          <th>직위</th>
          <th>입사일</th>
          <th>급여</th>
        </tr>
      </thead>
      <tbody>
      
      </tbody>
    </table>
  </main>
</div>
</body>
</html>