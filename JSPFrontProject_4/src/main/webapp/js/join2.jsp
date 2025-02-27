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
  width: 100%;
}
</style>
<script type="text/javascript" src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
function postfind(){
	new daum.Postcode({
		oncomplete:function(data){
			document.querySelector('#post').value=data.zonecode
			document.querySelector('#addr1').value=data.address
		}
	}).open()
}
</script>
</head>
<body>
   <div class="container">
     <h3 class="text-center">회원가입</h3>
     <div class="row">
      <form name="frm">
      <table class="table">
       <tr>
        <th class="text-center" width=15%>우편번호</th>
        <td width=85%>
         <input type=text size=7 class="input-sm" readonly id="post">
         <input type=button value="우편번호 검색" 
           class="btn-sm btn-success" onclick="postfind()">
        </td>
       </tr>
       <tr>
        <th class="text-center" width=15%>주소</th>
        <td width=85%>
         <input type=text size=50 class="input-sm" readonly id="addr1">
        </td>
       </tr>
       <tr>
        <th class="text-center" width=15%>상세주소</th>
        <td width=85%>
         <input type=text size=50 class="input-sm" name="addr2">
        </td>
       </tr>
      </table>
      </form>
     </div>
   </div>
</body>
</html>