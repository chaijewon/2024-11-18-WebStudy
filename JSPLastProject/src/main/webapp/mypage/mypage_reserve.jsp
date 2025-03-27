<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	// window.onload=function(){} => 자바스크립트 
	// $(function(){}) : Jquery = $(document).ready(function(){})
	// mounted() : Vue.js
	// ComponentDidMount() : React.js => useEffect()
	$('.btns').click(function(){
		let rno=$(this).attr("data-rno")
		$.ajax({
			type:'post',
			url:'../mypage/mypage_reserve_info.do',
			data:{"rno":rno},
			success:function(result)
			{
				//alert(result)
				let json=JSON.parse(result);
				//alert(json);
				$('#rno').text(json.rno)
				$('#day').text(json.day)
				$('#time').text(json.time)
				$('#inwon').text(json.inwon)
				$('#redate').text(json.regdate)
				
				$('#name').text(json.name)
				$('#score').text(json.score)
				$('#address').text(json.address)
				$('#phone').text(json.phone)
				$('#theme').text(json.theme)
				$('#content').text(json.content)
				$('#poster').attr("src",json.poster)
				
				$('#show').show()
				
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
  <c:if test="${count==0 }">
  <table class="table">
    <tr>
      <td class="text-center">
        <h3>예약된 내역이 없습니다</h3>
      </td>
    </tr>
  </table>
  </c:if>
  <c:if test="${count!=0 }">
  <table class="table">
    <tr>
     <th class="text-center">번호</th>
     <th class="text-center"></th>
     <th class="text-center">업체명</th>
     <th class="text-center">예약일</th>
     <th class="text-center">예약시간</th>
     <th class="text-center">인원</th>
     <th class="text-center"></th>
    </tr>
    <c:forEach var="vo" items="${list }">
     <tr>
      <th class="text-center">${vo.rno }</th>
      <th class="text-center">
       <img src="https://www.menupan.com${vo.fvo.poster }" style="width: 30px;height: 30px">
      </th>
      <th class="text-center">${vo.fvo.name }</th>
      <th class="text-center">${vo.day }</th>
      <th class="text-center">${vo.time }</th>
      <th class="text-center">${vo.inwon }</th>
      <th class="text-center">
       <c:if test="${vo.isok=='y' }">
        <input type=button class="btn-primary btn-sm btns"
          value="예약완료" data-rno="${vo.rno }"
        >
       </c:if>
       <c:if test="${vo.isok=='n' }">
        <span class="btn-default btn-sm">예약대기</span>
       </c:if>
        <a href="../mypage/reserve_cancel.do?rno=${vo.rno }" class="btn btn-success btn-sm">취소</a>
      </th>
     </tr>
    </c:forEach>
  </table>
  </c:if>
     <div style="height: 10px"></div>
    <div id="show" style="display: none">
     <h3>예약정보</h3>
     <hr>
     <table class="table">
       <tr>
        <td width="20%">예약번호</td>
        <td width="80%" id="rno"></td>
       </tr>
       <tr>
        <td width="20%">예약일</td>
        <td width="80%" id="day"></td>
       </tr>
       <tr>
        <td width="20%">예약시간</td>
        <td width="80%" id="time"></td>
       </tr>
       <tr>
        <td width="20%">예약인원</td>
        <td width="80%" id="inwon"></td>
       </tr>
       <tr>
        <td width="20%">예약등록일</td>
        <td width="80%" id="regdate"></td>
       </tr>
     </table>
     <h3>맛집 정보</h3>
     <hr>
     <table class="table">
       <tr>
         <td width=50% class="text-center" rowspan="8">
          <div class="post-thumb">
           <img src="" style="width: 450px;height: 400px"
           class="img-rounded" id="poster"
           >
          </div>
         </td>
         <td colspan="2">
           <h3><span id="name"></span><span style="color: orange;" id="score"></span></h3>
         </td>
       </tr>
       <tr>
         <th width=15%>주소</th>
         <td width=35% id="address"></td>
       </tr>
       <tr>
         <th width=15%>전화</th>
         <td width=35% id="phone"></td>
       </tr>
       <tr>
         <th width=15%>테마</th>
         <td width=35% id="theme"></td>
       </tr>
      </table>
      <table class="table">
        <tr>
         <td id="content"></td>
        </tr>
      </table>  
    </div>
</body>
</html>