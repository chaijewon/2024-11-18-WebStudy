<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
	$('#year').change(function(){
		let rdays=$("#tds").attr("data-rdays");
		let year=$('#year').val()
		let month=$('#month').val()
		$.ajax({
			type:'post',
			url:'../reserve/reserve_day.do',
			data:{"rdays":rdays,"year":year,"month":month},
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
	
	$('#month').change(function(){
		let rdays=$("#tds").attr("data-rdays");
		let year=$('#year').val()
		let month=$('#month').val()
		console.log(rdays+":"+year+":"+month)
		$.ajax({
			type:'post',
			url:'../reserve/reserve_day.do',
			data:{"rdays":rdays,"year":year,"month":month},
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
       <td class="text-center" data-rdays="${rdays }" id="tds">${year }년도 ${month}월</td>
     </tr>
     <tr>
       <td>
         <select name="year" id="year" class="form-control-sm">
           <c:forEach var="i" begin="2025" end="2030">
             <option ${i==year?"selected":"" }>${i }</option>
           </c:forEach>
         </select>년도 &nbsp;
         <select name="month" id="month" class="form-control-sm">
           <c:forEach var="i" begin="1" end="12">
             <option ${i==month?"selected":"" }>${i }</option>
           </c:forEach>
         </select>월
       </td>
     </tr>
   </table>
   <div style="height: 10px"></div>
   <table class="table">
    <tr class="table-danger">
      <c:forEach var="i" items="${weeks }" varStatus="s">
        <c:choose>
          <c:when test="${s.index==0 }">
            <c:set var="color" value="red"/>
          </c:when>
          <c:when test="${s.index==6 }">
            <c:set var="color" value="blue"/>
          </c:when>
          <c:otherwise>
            <c:set var="color" value="black"/>
          </c:otherwise>
        </c:choose>
        <th class="text-center"><span style="color:${color}">${i }</span></th>
      </c:forEach>
    </tr>
    <c:set var="week" value="${week }"/>
    <c:forEach var="i" begin="1" end="${lastday }">
      <c:if test="${i==1 }">
        <tr>
         <c:forEach var="j" begin="1" end="${week }">
           <td class="text-center" height="35">&nbsp;</td>
         </c:forEach>
      </c:if>
      
      <c:if test="${rday[i]==1}">
        <td class="text-center ${day==i?'table-success':'table-danger' }" height="35">
         <span style="font-weight: bold;">${i }</span>
        </td>
      </c:if>
      <c:if test="${rday[i]==0}">
        <td class="text-center ${day==i?'table-success':'' }" height="35">
         <span style="color:gray;">${i }</span>
        </td>
      </c:if>
      
      <c:set var="week" value="${week+1 }"/>
      <c:if test="${week>6 }">
        <c:set var="week" value="0"/>
        </tr>
        <tr>
      </c:if>
    </c:forEach>
    </tr>
   </table>
</body>
</html>