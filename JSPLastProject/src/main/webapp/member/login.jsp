<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/bootstrap/bootstrap.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>

</head>
<body>
   <div class="container" style="margin-top: 50px">
     <div class="row" style="width:290px">
       <table class="table">
        <tr>
         <th width=20%>ID</th>
         <td width=80%>
          <input type=text id="id" size=15 class="form-control-sm">
         </td>
        </tr>
        <tr>
         <th width=20%>PW</th>
         <td width=80%>
          <input type=password id="pwd" size=15 class="form-control-sm">
         </td>
        </tr>
        <tr>
         <td colspan="2" class="text-center">
          <input type=button id="logBtn" class="btn-sm btn-success"
            value="로그인">
          <input type=button id="canBtn" class="btn-sm btn-info"
            value="취소">
         </td>
        </tr>
       </table>
     </div>
   </div>
</body>
</html>