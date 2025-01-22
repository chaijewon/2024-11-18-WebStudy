<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*,com.sist.vo.*"%>
<%
    String fno=request.getParameter("fno");
    FoodDAO dao=FoodDAO.newInstance();
    FoodVO vo=dao.foodDetailData(Integer.parseInt(fno));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <div class="row">
   <table class="table">
     <tr>
       <td class="text-center" rowspan="7" width=40%>
        <img src="<%=vo.getPoster() %>"
         style="width:100%">
       </td>
       <td colspan="2">
         <h3><%=vo.getName() %>&nbsp;<span style="color:orange;"><%=vo.getScore() %></span></h3>
       </td>
     </tr>
     <tr>
       <td width="15%" style="color:gray;">음식종류</td>
       <td width="45%"><%=vo.getType() %></td>
     </tr>
     <tr>
       <td width="15%" style="color:gray;">주소</td>
       <td width="45%"><%=vo.getAddress() %></td>
     </tr>
     <tr>
       <td width="15%" style="color:gray;">전화</td>
       <td width="45%"><%=vo.getPhone() %></td>
     </tr>
     <tr>
       <td width="15%" style="color:gray;">영업시간</td>
       <td width="45%"><%=vo.getTime() %></td>
     </tr>
     <tr>
       <td width="15%" style="color:gray;">주차</td>
       <td width="45%"><%=vo.getParking() %></td>
     </tr>
     <tr>
       <td width="15%" style="color:gray;">테마</td>
       <td width="45%"><%=vo.getTheme() %></td>
     </tr>
     
   </table>
   <table class="table">
     <tr>
       <td><%=vo.getContent() %></td>
     </tr>
     <tr>
       <td class="text-right">
         <a href="#" class="btn btn-xs btn-danger">찜하기</a>
         <a href="#" class="btn btn-xs btn-info">예약하기</a>
         <a href="main.jsp" class="btn btn-xs btn-warning">목록</a>
       </td>
     </tr>
   </table>
  </div>
</body>
</html>