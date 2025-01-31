<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*"%>
<%
    FoodDAO dao=FoodDAO.newInstance();
    List<FoodVO> list=dao.foodListData();
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <center>
    <h1>맛집 목록</h1>
    <table border="1" borderolor=black width=800>
     <thead>
      <tr>
        <th>번호</th>
        <th></th>
        <th>업체명</th>
        <th>음식종류</th>
        <th>주소</th>
      </tr>
     </thead>
     <tbody>
       <%
           for(FoodVO vo:list)
           {
       %>
              <tr>
               <td align=center><%= vo.getFno() %></td>
               <td align=center>
                <img src="<%=vo.getPoster() %>"
                 width="35" height="35">
               </td>
               <td><%=vo.getName() %></td>
               <td><%=vo.getType() %></td>
               <td><%=vo.getAddress() %></td>
              </tr>    
       <%
           }
       %>
     </tbody>
    </table>
  </center>
</body>
</html>