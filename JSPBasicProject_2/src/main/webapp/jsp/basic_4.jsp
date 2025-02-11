<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*"%>
<%
    EmpDAO dao=EmpDAO.newInstance();
    List<FoodVO> list=dao.foodListData();
    // switch (X) , while (X) , do~while (X) , break , continue 
    // for / if if~else 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="table.css">
<style type="text/css">
.container{
  width: 900px;
  margin-top:50px;
}
h3{
  text-align: center;
}
.table_content{
  width: 800px;
  margin: 0px auto;
}
</style>
</head>
<body>
  <div class="container">
   <h3>맛집목록</h3>
   <table class="table_content">
     <tr>
      <th>순위</th>
      <th></th>
      <th>업체명</th>
      <th>음식종류</th>
     </tr>
     <%
        for(FoodVO vo:list)
        {
        	if(vo.getType().contains("한식"))
        	{
     %>
            <tr>
             <td align="center"><%= vo.getFno() %></td>
             <td align="center">
              <img src="<%= vo.getPoster()%>" width="30px" height="30px">
             </td>
             <td><%= vo.getName() %></td>
             <td><%= vo.getType() %></td>
            </tr>
     <%
        	}
        }
     %>
   </table>
  </div>
</body>
</html>