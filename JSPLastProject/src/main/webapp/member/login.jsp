<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/bootstrap/bootstrap.min.css">
<style type="text/css">
#login img{
  margin: 10px 0;
}
#login .center {
  text-align: center;
}

#login .login {
  max-width: 300px;
	margin: 35px auto;
}

#login .login-form{
  padding:0px 25px;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#canBtn').click(function(){
		parent.Shadowbox.close()
	})
	$('#logBtn').click(function(){
		let id=$('#id').val()
		if(id.trim()==="")
		{
			$('#id').focus()
			return
		}
		
		let pwd=$('#pwd').val()
		if(pwd.trim()==="")
		{
			$('#pwd').focus()
			return
		}
		
		$.ajax({
			type:'post',
			url:'../member/login_ok.do',
			data:{"id":id,"pwd":pwd},
			success:function(result)
			{
				// NOID , NOPWD , OK
				if(result==='NOID')
				{
					alert("아이디 존재하지 않습니다")
					$('#id').val("")
					$('#pwd').val("")
					$('#id').focus()
				}
				else if(result==='NOPWD')
				{
					alert("비밀번호가 틀립니다")
					$('#pwd').val("")
					$('#pwd').focus()
				}
				else
				{
					
					parent.location.href="../main/main.do"
					parent.Shadowbox.close()
				}
			}
		})
	})
	
})
</script>
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