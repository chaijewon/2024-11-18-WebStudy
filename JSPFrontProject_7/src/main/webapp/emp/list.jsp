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
  width: 800px;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	// 시작과 동시에 데이터 읽기 
	
	
	$('input[type="button"]').on('click',function(){
		$.ajax({
			type:'get',
			url:'list_json.do',
			success:function(json)
			{
				let html=''
				let emp=JSON.parse(json) // 문자열을 JSON으로 변경 
				// Vue / React => 자동 처리 
				emp.map(function(vo){
					html+='<tr>'
					    +'<td class="text-center">'+vo.empno+'</td>'
					    +'<td class="text-center">'+vo.ename+'</td>'
					    +'<td class="text-center">'+vo.job+'</td>'
					    +'<td class="text-center">'+vo.hiredate+'</td>'
					    +'<td class="text-center">'+vo.sal+'</td>'
					    +'</tr>'
					       
				})
				$('#tbody').html(html)
			}
		})
	})
})
</script>
</head>
<body>
  <div class="container">
   <div class="row">
    <h3 class="text-center">사원 목록</h3>
    <table class="table">
     <tr>
      <td>
       <input type=button class="btn-sm btn-danger" value="사원 목록 읽기">
      </td>
     </tr>
    </table>
    <table class="table">
     <thead>
     <tr>
	     <th class="text-center">사번</th>
	     <th class="text-center">이름</th>
	     <th class="text-center">직위</th>
	     <th class="text-center">입사일</th>
	     <th class="text-center">급여</th>
     </tr>
     </thead>
     <tbody id="tbody">
       
     </tbody>
    </table>
   </div>
  </div>
</body>
</html>