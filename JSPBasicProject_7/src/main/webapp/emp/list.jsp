<%@page import="com.sist.vo.EmpVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sist.model.*"%>
<jsp:useBean id="model" class="com.sist.model.EmpModel"/>
<%
    model.empListData(request);
    List<EmpVO> list=(List<EmpVO>)request.getAttribute("list");
    // jstl
%>
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
   <h3 class="text-center">사원 목록</h3>
   <div class="row">
    <table class="table table-striped">
     <thead>
      <tr>
        <th class="text-center">사번</th>
        <th class="text-center">이름</th>
        <th class="text-center">직위</th>
        <th class="text-center">입사일</th>
        <th class="text-center">급여</th>
      </tr>
     </thead>
     <tbody>
       <%--
           <c:forEach var="vo" items="${list}"> JSTL
        --%>
       <%
          for(EmpVO vo:list)
          {
       %>
             <tr>
		        <td class="text-center"><%=vo.getEmpno() %></td>
		        <td class="text-center"><%=vo.getEname() %></td>
		        <td class="text-center"><%=vo.getJob() %></td>
		        <td class="text-center"><%=vo.getHiredate().toString() %></td>
		        <td class="text-center"><%=vo.getSal() %></td>
		      </tr>
       <%
          }
       %>
     </tbody>
    </table>
   </div>
  </div>
</body>
</html>