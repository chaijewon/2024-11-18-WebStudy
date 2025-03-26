<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%--
       Front : Ajax(Jquery) , NodeJS , Vue/React
         +
       Back : Java / 오라클 / JSP / Spring / Spring-Boot
                      | MyBatis / JPA
       
 --%>
<script type="text/javascript">
$(function(){
	$('.times').click(function(){
		let time=$(this).text()
		$('#food_reserve_time').text(time)
		$('#rtime').val(time)
		$.ajax({
			type:'post',
			url:'../reserve/inwon_info.do',
			success:function(result)
			{
				$('#reserve_inwon').html(result)
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
  <c:forEach var="t" items="${tList }">
   <span class="btn btn-xs btn-info times" style="margin-left: 5px;margin-top: 5px;">
     ${t }
   </span>
  </c:forEach>
</body>
</html>