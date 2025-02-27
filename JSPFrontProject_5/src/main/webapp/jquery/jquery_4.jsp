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
	$('input[type=text]').val("admin")
	$('input[type=password]').val("1234")
	/*
	   기본 : 구분자 
	         id=""     => $('#아이디') => 125page
	         class=""  => 
	         
	*/
})
</script>
</head>
<body>
  <div class="container">
   <div class="row">
     <h3 class="text-center">Login</h3>
     <table class="table">
      <tr>
       <th class="text-center" width=20%>ID</th>
       <td width=80%>
        <input type=text size=15 class="input-sm">
       </td>
      </tr>
      <tr>
       <th class="text-center" width=20%>PW</th>
       <td width=80%>
        <input type=password size=15 class="input-sm">
       </td>
      </tr>
     </table>
   </div>
  </div>
</body>
</html>