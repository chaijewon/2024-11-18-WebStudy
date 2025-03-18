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
  <table class="table">
   <tr>
     <th class="text-center">번호</th>
     <th class="text-center"></th>
     <th class="text-center">업체명</th>
     <th class="text-center"></th>
   </tr>
   <c:forEach var="vo" items="${list }">
     <tr>
      <td class="text-center">${vo.jno}</td>
      <td class="text-center">
        <img src="https://www.menupan.com${vo.fvo.poster }" style="width:30px;height: 30px">
      </td>
      <td class="text-center">${vo.fvo.name }</td>
      <td class="text-center">
        <input type=button class="btn btn-danger btn-xs"
          value="상세보기">
        <a href="../jjim/jjim_cancel.do?jno=${vo.jno }&rno=${vo.rno}" class="btn btn-primary btn-xs">취소</a>
      </td>
     </tr>
   </c:forEach>
  </table>
</body>
</html>