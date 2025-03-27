<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
        <input type=button class="btn-primary btn-sm"
          value="예약완료"
        >
       </c:if>
       <c:if test="${vo.isok=='n' }">
        <span class="btn-default btn-sm">예약대기</span>
       </c:if>
        <a href="#" class="btn btn-success btn-sm">취소</a>
      </th>
     </tr>
    </c:forEach>
  </table>
  </c:if>
</body>
</html>