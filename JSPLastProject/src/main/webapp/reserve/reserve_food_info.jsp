<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.dataTr:hover{
  background-color: pink;
  cursor: pointer;
}
</style>
<script type="text/javascript">
$(function(){
	$('.types').click(function(){
		let tname=$(this).val()
		$.ajax({
			type:'post',
			url:'../reserve/reserve_food_info.do',
			data:{"type":tname},
			success:function(result)
			{
				$('#food_list').html(result)
			},
			error:function(request,status,error)
			{
				console.log(error)
			}
		})
		
	})
	
	$('.dataTr').click(function(){
		$('.dataTr').css('backgroundColor','white')
		let fno=$(this).attr("data-fno")
		let name=$(this).attr("data-name")
		let poster=$(this).attr("data-poster")
		let rdays=$(this).attr("data-rdays");
		$(this).css("backgroundColor","pink")
		$('#food_poster').attr("src",poster)
		$('#food_name').text(name)
		
		$.ajax({
			type:'post',
			url:'../reserve/reserve_day.do',
			data:{"rdays":rdays},
			success:function(result)
			{
				$('#food_rdays').html(result)
				
			},
			error:function(request,status,error)
			{
				console.log(error)
			}
		})
	})
})
</script>
</head>
<body>
   <table class="table">
     <tr>
       <td class="text-center">
        <input type=button class="btn-xs btn-success types" 
        value="한식">
        <input type=button class="btn-xs btn-danger types" 
        value="양식">
        <input type=button class="btn-xs btn-info types" 
        value="중식">
        <input type=button class="btn-xs btn-warning types" 
        value="일식">
        <input type=button class="btn-xs btn-primary types" 
        value="분식">
       </td>
     </tr>
   </table>
   <table class="table">
    <tr>
      <th class="text-center"></th>
      <th class="text-center">업체명</th>
    </tr>
    <c:forEach var="vo" items="${fList }">
      <tr class="dataTr"
         data-fno="${vo.fno }"
         data-name="${vo.name }"
         data-poster="https://www.menupan.com${vo.poster }"
         data-rdays="${vo.rdays }"
      >
       <td class="text-center">
        <img src="https://www.menupan.com${vo.poster }" 
          style="width: 30px;height: 30px">
       </td>
       <td>${vo.name}</td>
      </tr>
    </c:forEach>
   </table>
</body>
</html>