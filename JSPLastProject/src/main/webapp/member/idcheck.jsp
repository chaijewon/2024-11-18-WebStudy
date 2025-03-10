<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/bootstrap/bootstrap.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#checkBtn').click(function(){
		let id=$('#id').val()
		if(id.trim()==="")
		{
			$('#id').focus()
			return
		}
		$.ajax({
			type:'post',
			url:'../member/idcheck_ok.do',
			data:{"id":id.trim()},
			success:function(result)
			{
				//alert(result)
				let count=parseInt(result);
				if(count===0)
				{
					$('#oktr').show()
				    $('#res').html(
				     '<span style="color:blue">'
				     +id+'는(은) 사용가능한 아이디입니다</span>'
				    )	
				    $('#id').prop('disabled',true)
				}
				else
				{
					$('#oktr').hide()
				    $('#res').html(
				     '<span style="color:blue">'
				     +id+'는(은) 이미 사용중인 아이디입니다</span>'
				    )	
				    $('#id').val("")
				    $('#id').focus()
				}
			}
			
		})
	})
	$('#ok').click(function(){
		parent.frm.id.value=$('#id').val()
		parent.Shadowbox.close()
	})
})
</script>
</head>
<body>
  <div class="container" style="margin-top: 50px">
    <div class="row" style="width:350px">
      <table class="table">
        <tr>
         <td>ID:<input type=text id=id size=15 class="form-control-sm">
                <input type=button value="아이디중복체크"
                 class="btn-sm btn-primary" id="checkBtn">
         </td>
        
        </tr>
        <tr>
          <td class="text-center" id="res">
           
          </td>
        </tr>
        
        <tr style="display:none" id="oktr">
          <td class="text-center">
           <input type=button value="확인"
            class="btn-sm btn-success" id="ok">
          </td>
        </tr>
      </table>
    </div>
  </div>
</body>
</html>