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
      <tr>
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