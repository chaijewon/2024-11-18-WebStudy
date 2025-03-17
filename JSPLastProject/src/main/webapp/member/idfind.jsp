<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.14.0/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script type="text/javascript">
  $(function(){
	  $( "#tabs" ).tabs();
	  $('#emailBtn').click(function(){
	    	let name=$('#e_name').val()
	    	if(name.trim()==="")
	    	{
	    		$('#e_name').focus()
	    		$('#result_email').html('<font color="red">이름을 입력하세요</font>')
	    		return
	    	}
	    	let email=$('#email').val()
	    	if(email.trim()==="")
	    	{
	    		$('#email').focus()
	    		$('#result_email').html('<font color="red">이메일을 입력하세요</font>')
	    		return
	    	}
	    	$.ajax({
	    		type:'post',
	    		url:'../member/idfind_ok.do',
	    		data:{"name":name,"email":email},
	    		success:function(result){
	    			if(result==='no')
	    			{
	    				$('#result_email').html('<h3><font color="red">이름이나 이메일이 존재하지 않습니다</font></h3>')
	    				$('#e_name').val("")
	    				$('#email').val("")
	    				$('#e_name').focus()
	    			}
	    			else
	    			{
	    				$('#result_email').html('<h3><font color="blue">'+result+'</font></h3>')
	    			}
	    			
	    		},
	    		error:function(request,status,error){
	    			console.log(error)
	    		}
	    	})
	    })
  })
  </script>
  <style type="text/css">
  #tabs{
    width: 600px;
  }
  </style>
</head>
<body>
<div class="breadcumb-area" style="background-image: url(../img/bg-img/breadcumb.jpg);">
        <div class="container h-100">
            <div class="row h-100 align-items-center">
                <div class="col-12">
                    <div class="bradcumb-title text-center">
                        <h2>아이디 찾기</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="breadcumb-nav">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="#"><i class="fa fa-home" aria-hidden="true"></i> Home</a></li>
                            <li class="breadcrumb-item active" aria-current="page">food-list Page</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    <!-- ****** Breadcumb Area End ****** -->

    <!-- ****** Archive Area Start ****** -->
    <section class="archive-area section_padding_80">
        <div class="container">
            <div class="row" style="width:800px;margin:0px auto">
              <div id="tabs">
	  <ul>
	    <li><a href="#tabs-1">이메일로 찾기</a></li>
	    <li><a href="#tabs-2">전화번호로 찾기</a></li>
	  </ul>
	  <div id="tabs-1">
	    <table class="table">
	     <tr>
	      <td width=20%>이름</td>
	      <td width=80%>
	       <input type=text class="input-sm" name="name" size=25 id="e_name">
	      </td>
	     </tr>
	     <tr>
	      <td width=20%>이메일</td>
	      <td width=80%>
	        <input type=text class="input-sm" name="email" size=50 id="email">
	      </td>
	     </tr>
	     <tr>
	      <td class="text-center" colspan="2">
	        <input type=button class="btn-sm btn-primary" value="검색" id="emailBtn">
	      </td>
	     </tr>
	     <tr>
	      <td class="text-center" colspan="2">
	       <span id="result_email"></span>
	      </td>
	     </tr>
	    </table>
	  </div>
	  <div id="tabs-2">
	    <table class="table">
	     <tr>
	      <td width=20%>이름</td>
	      <td width=80%>
	       <input type=text class="input-sm" name="name" size=25 id="p_name">
	      </td>
	     </tr>
	     <tr>
	      <td width=20%>전화번호</td>
	      <td width=80%>
	        <input type=text class="input-sm" name="phone" size=25 id="phone">
	      </td>
	     </tr>
	     <tr>
	      <td class="text-center" colspan="2">
	        <input type=button class="btn-sm btn-primary" value="검색" id="phoneBtn">
	      </td>
	     </tr>
	     <tr>
	      <td class="text-center" colspan="2">
	       <span id="result_phone"></span>
	      </td>
	     </tr>
	    </table>
	  </div>
	</div>
            </div>
         </div>
    </section>
</body>
</html>