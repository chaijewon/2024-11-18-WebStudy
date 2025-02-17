<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
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
  margin: 0px auto;
  width: 600px;
}
</style>
</head>
<body>
  <div class="container">
   <div class="row">
    <div class="text-center">
     <ul class="pagination">
     <%
        for(int i=1;i<=10;i++)
        {
     %>
          <li><a href="#"><%= i %></a></li> 
     <%
        }
     %>
     </ul>
    </div>
   </div>
   <%--
      var : 자동 데이터형 
      
      var="i" begin="1" => int 
      var="vo" items="${list}"> => EmpVO
      List<EmpVO> 
      List<FoodVO> => FoodVO
      
      JSTL은 XML형식이다 
      1. 여느태그 = 닫는태그
      2. 속성은 반드시 ""
      3. 속성은 사용자 정의가 없다 => 지정된 속성만 사용
      
      forEach 
        = var => 변수 
        = begin => 초기값
        = end => 범위  ====> <=
        = step => 증가값
        = items => 배열/컬렉션 
        = varStatus => 배열/컬렉션의 인덱스번호 
    --%>
   <div class="row">
     <div class="text-center">
       <ul class="pagination">
         <%-- --는 없다 (감소는 없다) , 무조건 증가식만 가능 --%>
         <c:forEach var="i" begin="1" end="10" step="2">
           <li><a href="#">${i }</a></li>
         </c:forEach>
       </ul>
     </div>
   </div>
  </div>
</body>
</html>