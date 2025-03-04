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
  width: 960px;
}
.a{
  overflow: hidden;
  white-space: nowrap;
  text-overflow: ellipsis;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	// list_json.do?type=한식
	$('.btn-sm').click(function(){
		let type=$(this).val()
		$.ajax({
			type:'post',
			url:'list_json.do',
			data:{"type":type},
			success:function(result)
			{
				//alert(result)
				let json=JSON.parse(result)
				//$('.print').text(result)
				let html='';
				json.map(function(vo){
					html+='<div class="col-sm-3">'
					     +'<div class="thumbnail">'
					     +'<img src="'+vo.poster+'" style="width:230px;height:200px">'
					     +'<p class="a">'+vo.name+'</p>'
					     +'</div>'
					     +'</div>'
				})  
				$('.print').html(html)
			}
			
		})
	})
})
</script>
</head>
<body>
  <div class="container">
    
    <div class="row print">
     
    </div>
    <div class="row text-center" style="margin-top: 20px">
     <input type="button" value="한식" class="btn-sm btn-danger">
     <input type="button" value="양식" class="btn-sm btn-info">
     <input type="button" value="중식" class="btn-sm btn-success">
     <input type="button" value="일식" class="btn-sm btn-warning">
     <input type="button" value="분식" class="btn-sm btn-primary">
    </div>
  </div>
</body>
</html>